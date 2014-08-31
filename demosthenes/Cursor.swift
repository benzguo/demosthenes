public class Cursor {
    var section: Section = .Preverse1
    var index: Int = 0
    var nextEventTime: Double = 0.0

    init() {
        nextEventTime = section.events()[index]
    }

    func step() {
        index++
        if index >= section.events().count {
            index = 0
            let maybeSection: Section? = Section.fromRaw(section.toRaw() + 1)
            if let nextSection = maybeSection {
                section = nextSection
                nextEventTime = section.events()[index]
            }
            else {
                nextEventTime = Double.infinity
            }
        }
        else {
            nextEventTime = section.events()[index]
        }
    }
}
