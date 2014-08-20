public enum Event: Double { // in seconds
    case Start = 0
    case IntroRiff = 6.027
    case IntroLead1 = 8.438
    case IntroLead2 = 18.189
    case IntroLastNote = 26.645
    case Verse1 = 28.018

    static let allValues = [
        Start,
        IntroRiff,
        IntroLead1,
        IntroLead2,
        IntroLastNote,
        Verse1
    ]

    static var lastEvent: Event {
        get {
            return Event.allValues[count - 1]
        }
    }

    static var count: Int {
        get {
            return Event.allValues.count
        }
    }
}

public class Song {
    var currentIndex: Int
    var currentEvent: Event
    var nextEvent: Event

    init () {
        currentIndex = 0
        currentEvent = Event.allValues[currentIndex]
        nextEvent = Event.allValues[currentIndex + 1]
    }

    func step() {
        if nextEvent == Event.lastEvent {
            return
        }
        currentIndex++
        currentEvent = Event.allValues[currentIndex]
        nextEvent = Event.allValues[currentIndex + 1]
    }
}
