import Foundation
import CoreMIDI
import CoreAudio
import AudioToolbox

public protocol MIDIPlayerDelegate {
    func didReceiveNoteOnEvents(events: [MIDIEventNoteOn])
}

public class MIDIPlayer: MIDIPlayerCoreDelegate {
    public var delegate: MIDIPlayerDelegate?
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

    // MARK: - MIDIPlayerCoreDelegate
    public func didReceivePackets(packets: [AnyObject]!) {
        let events: [MIDIEventNoteOn] = packets.map {packet in
            let p = packet as [String: Int]
            return MIDIEventNoteOn(note: p["note"]!, velocity: p["velocity"]!)
        }
        if delegate != nil {
            delegate?.didReceiveNoteOnEvents(events)
        }       
    }


}
