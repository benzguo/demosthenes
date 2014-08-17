@import CoreMIDI;
@import CoreAudio;
@import AudioToolbox;

@protocol MIDIPlayerCoreDelegate

- (void)didReceivePackets:(NSArray *)packets;

@end

@interface MIDIPlayerCore : NSObject

@property (weak, nonatomic) id<MIDIPlayerCoreDelegate> delegate;

- (instancetype)initWithFilename:(NSString *)filename delegate:(id<MIDIPlayerCoreDelegate>)delegate;
- (void)play;
- (void)stop;

@end
