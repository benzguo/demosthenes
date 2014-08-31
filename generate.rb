require 'midilib/sequence'
require 'midilib/io/midifile'
include MIDI

# time of first event (sec)
first_event_sec = 10.245
sections = [
	"Preverse1",
	"Verse1",
	"Prechorus1",
	"Chorus1",
	"Preverse2",
	"Verse2",
	"Prechorus2",
	"Bridge",
	"Chorus2",
	"Chorus3",
	"Outro"
]

seq = MIDI::Sequence.new()
tracks = []
events = []

File.open('midi/TacoTree.mid', 'rb') do | file |
    seq.read(file) do | track, num_tracks, i |
    	print "read #{i} of #{num_tracks} tracks\n"
		tracks += [track]
   	end 
end

# hack for converting midilib time to sec
is_first_event = true
time_factor = 1
last_note = "C0"
section = []

# not sure what track[0] is, maybe tempo?
track = tracks[1]
track.each do | event |
    if MIDI::NoteOn === event
    	if is_first_event
	    	time_factor = first_event_sec/event.time_from_start
    	end
    	msec = (event.time_from_start * time_factor)
    	msec = msec.round(3)
    	event.print_note_names = true

    	if event.note_to_s == last_note or is_first_event
    		section += [msec]
	    	is_first_event = false
    	else 
    		events += [section]
    		section = [msec]
    	end

    	last_note = event.note_to_s
    end
end
events += [section]

events.each do |section|
	print "#{section}\n"
end

File.open("Sequencer.swift", 'w') do |file| 
	s = "
import SceneKit
public enum Section: Int {
"
	file.write(s)
	for i in 0..sections.count-1
		file.write("    case #{sections[i]}")
		if i == 0
			file.write( " = 0")	
		end
		file.write("\n")
	end

	s = "
static let eventsTable: [[Double]] = 
[
"
	file.write(s)
	events.each do |section|
		file.write("    #{section},\n")
	end
	file.write("]\n")

s = "
    func events() -> [Double] {
        return Section.eventsTable[self.toRaw()]
    }
}

extension MainViewController {

    func renderer(aRenderer: SCNSceneRenderer!, willRenderScene scene: SCNScene!, atTime time: NSTimeInterval) {
        let time = NSDate().timeIntervalSinceDate(startTime)
        if isnan(time) {
            return
        }
        if time >= cursor.nextEventTime {
            cursor.step()
            let section = cursor.section
            let index = cursor.index
            switch section {
"
	file.write(s)
	sections.each do |name|
		s = "
            case .#{name}:
            	#{name}(index)
"
		file.write(s)
	end

	s = "
            default:
                break
            }
        }
    }
}
"
	file.write(s)
end

for i in 0..sections.count-1
	name = sections[i]
	num_events = events[i].count	
	File.open("#{name}.swift", 'w') do |file| 
		s = "
import SceneKit

extension MainViewController {
"
		file.write(s)
		s = "
	func #{name}(index: Int) {
	    SCNTransaction.begin()

	    switch index {"
    	file.write(s)
    	for i in 0..events[i].count - 1
    		s = "
    	case #{i}:
    		break
    		"
    		file.write(s)
    	end
    	s = "
    	SCNTransaction.commit()
    }
}
"
    	file.write(s)
	end
end



