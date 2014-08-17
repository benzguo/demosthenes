import Foundation
import CoreMIDI
import CoreAudio
import AudioToolbox

class MIDIPlayer {
    var player: MusicPlayer
    var sequence: MusicSequence
    var client: MIDIClientRef
    var endpoint: MIDIEndpointRef

    init(filename: String) {
        // load MIDI file into sequence
        let filePath = NSBundle.mainBundle().pathForResource(filename, ofType: "mid")
        let fileURL = NSURL.fileURLWithPath(filePath)
        sequence = MusicSequence()
        NewMusicSequence(&sequence)
        MusicSequenceFileLoad(sequence, fileURL, 0, 0)

        // load sequence into player
        player = MusicPlayer()
        NewMusicPlayer(&player)
        MusicPlayerSetSequence(player, sequence)
        MusicPlayerPreroll(player)

        // create client
        client = MIDIClientRef()
        let clientCreateResult = MIDIClientCreate("Virtual Client", notifyProc, nulDev, &client)
        // TODO: check for error

        // create endpoint
        endpoint = MIDIEndpointRef()
        let destinationCreateResult = MIDIDestinationCreate(client, "Virtual Destination", readProc, NULL, &endpoint)


    }

    deinit {
        MusicPlayerStop(player)
        DisposeMusicSequence(sequence)
        DisposeMusicPlayer(player)
    }

    func notifyProc(message: MIDINotification, refCon: voidPtr) {
        print("MIDI Notify, messageID=%d", message.messageID)
    }

    func readProc(pktList: MIDIPacketList, refCon: voidPtr, connRefCon: voidPtr) {

    }

    func play() {
        MusicPlayerStart(player)
    }

    func stop() {
        MusicPlayerStop(player)
    }


}
