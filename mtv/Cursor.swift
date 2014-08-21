public class Cursor {
    var section: Section = .Start
    var index: Int = 0
    var nextEventTime: Double = 0.0

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
