import Foundation
import CoreMIDI
import CoreAudio
import AudioToolbox

protocol MIDIPlayerDelegate {
    func didReceiveNoteOnEvents(events: [MIDIEventNoteOn])
}

class MIDIPlayer: MIDIPlayerCoreDelegate {
    var core: MIDIPlayerCore!
    var delegate: MIDIPlayerDelegate?

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

    // MARK: - MIDIPlayerCoreDelegate
    func didReceivePackets(packets: [AnyObject]!) {
        let events: [MIDIEventNoteOn] = packets.map {packet in
            let p = packet as [String: Int]
            return MIDIEventNoteOn(note: p["note"]!, velocity: p["velocity"]!)
        }
        if delegate != nil {
            delegate?.didReceiveNoteOnEvents(events)
        }       
    }


}
