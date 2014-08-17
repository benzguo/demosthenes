import Foundation
import CoreMIDI
import CoreAudio
import AudioToolbox

class MIDIPlayer: MIDIPlayerCoreDelegate {
    var core: MIDIPlayerCore!

    init(filename: String) {
        core = MIDIPlayerCore(filename: filename, delegate: self)
    }

    deinit {

    }

    func play() {
        core.play()
    }

    func stop() {
        core.stop()
    }

    // MARK: -
    // MARK: MIDIPlayerCoreDelegate
    func didReceivePackets(packets: [AnyObject]!) {
        for packet in packets as [[String: Int]] {
            print(packet["note"])
        }       
    }


}
