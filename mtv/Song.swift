public enum Event: Double { // in seconds
    case Beginning = 0

    case Organ = 0.47
    case FirstHits1 = 6.019
    case FirstHits2 = 6.799
    case FirstHits3 = 7.534
    case FirstHits4 = 7.836
    case FirstHits5 = 8.119

    case Intro1_1 = 8.438
    case Intro1_2 = 10.867
    case Intro1_3 = 13.322
    case Intro1_4 = 15.786
    case Intro2_1 = 18.189
    case Intro2_2 = 20.670
    case Intro2_3 = 23.117
    case Intro2_4 = 25.581

    case FirstVerse1_1 = 28.018
    case FirstVerse1_2 = 37.999
    case FirstVerse2_1 = 47.971
    case FirstVerse2_2 = 57.987

//    case FirstChorus1_1 = 0
//    case FirstChorus1_2 = 0
//    case FirstChorus1_3 = 0
//    case FirstChorus1_4 = 0
//    case FirstChorus2_1 = 0
//    case FirstChorus2_2 = 0
//    case FirstChorus2_3 = 0
//    case FirstChorus2_4 = 0
//
//    case SecondHits1 = 0
//    case SecondHits2 = 6.799
//    case SecondHits3 = 7.534
//    case SecondHits4 = 7.836
//    case SecondHits5 = 8.119
//
//    case SecondVerse1_1 = 28.018
//    case SecondVerse1_2 = 37.999
//    case SecondVerse2_1 = 47.971
//    case SecondVerse2_2 = 57.987
//
//    case Bridge1_1 = 0
//    case Bridge1_2 = 0
//    case Bridge2_1 = 0
//    case Bridge2_2 = 0
//
//    case Buildup1 = 0
//    case Buildup2 = 0
//    case Buildup3 = 0
//    case Buildup4 = 0
//
//    case LastChorus1_1 = 0
//    case LastChorus1_2 = 0
//    case LastChorus1_3 = 0
//    case LastChorus1_4 = 0
//    case LastChorus2_1 = 0
//    case LastChorus2_2 = 0
//    case LastChorus2_3 = 0
//    case LastChorus2_4 = 0
//
//    case LastHits1 = 0
//    case LastHits2 = 6.799
//    case LastHits3 = 7.534
//    case LastHits4 = 7.836
//    case LastHits5 = 8.119

    static let allValues = [
        Beginning,
        Organ,
    ]

    static var lastValue: Event {
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
        if nextEvent == Event.lastValue {
            return
        }
        currentIndex++
        currentEvent = Event.allValues[currentIndex]
        nextEvent = Event.allValues[currentIndex + 1]
    }
}
