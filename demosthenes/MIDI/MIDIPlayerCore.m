@import Foundation;
#import "MIDIPlayerCore.h"

@interface MIDIPlayerCore () {
    MusicPlayer player;
    MusicSequence sequence;
    MIDIClientRef client;
    MIDIEndpointRef endpoint;
}

@end


@implementation MIDIPlayerCore

- (instancetype)initWithFilename:(NSString *)filename delegate:(id<MIDIPlayerCoreDelegate>)delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;

        OSStatus result = noErr;

        // create client
        result = MIDIClientCreate(CFSTR("Virtual Client"), notifyProc, NULL, &client);
        NSAssert(result == noErr, @"MIDIClientCreate failed. Error code: %d '%.4s'", (int)result, (const char *)&result);

        // create endpoint
        result = MIDIDestinationCreate(client, CFSTR("Virtual Destination"), readProc, (__bridge void *)(delegate), &endpoint);
        NSAssert(result == noErr, @"MIDIDestinationCreate failed. Error code: %d '%.4s'", (int)result, (const char *)&result);

        NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:@"mid"];
        NSURL *fileURL = [NSURL fileURLWithPath:filePath];

        // load MIDI file into sequence
        NewMusicSequence(&sequence);
        MusicSequenceFileLoad(sequence, (__bridge CFURLRef)(fileURL), 0, 0);

        // set sequence endpoint
        MusicSequenceSetMIDIEndpoint(sequence, endpoint);

        // load sequence into player
        NewMusicPlayer(&player);
        MusicPlayerSetSequence(player, sequence);
        MusicPlayerPreroll(player);
    }
    return self;
}

- (void)play
{
    MusicPlayerStart(player);
}

- (void)stop
{
    MusicPlayerStop(player);
}

void notifyProc(const MIDINotification  *message, void *refCon)
{
    printf("MIDI Notify, messageId=%d,", message->messageID);
}

static void readProc(const MIDIPacketList *pktlist, void *refCon, void *connRefCon)
{
    id<MIDIPlayerCoreDelegate> delegate = (__bridge id<MIDIPlayerCoreDelegate>)refCon; // self
    NSMutableArray *packets = [NSMutableArray new];
    MIDIPacket *packet = (MIDIPacket *)pktlist->packet;
    for (int i=0; i < pktlist->numPackets; i++) {
        Byte midiStatus = packet->data[0];
        Byte midiCommand = midiStatus >> 4;

        // If the command is note-on
        if (midiCommand == 0x09) {
            Byte note = packet->data[1] & 0x7F;
            Byte velocity = packet->data[2] & 0x7F;
            NSDictionary *packetDictionary = @{@"note": @(note),
                                               @"velocity": @(velocity)
                                              };
            [packets addObject:packetDictionary];
        }
        packet = MIDIPacketNext(packet);
    }

    if ([packets count] > 0) {
        [delegate didReceivePackets:[packets copy]];
    }
}


- (void)dealloc
{
    MusicPlayerStop(player);
    DisposeMusicSequence(sequence);
    DisposeMusicPlayer(player);
}

@end
