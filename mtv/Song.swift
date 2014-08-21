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

    case FirstChorus1_1 = 67.985
    case FirstChorus1_2 = 70.591
    case FirstChorus1_3 = 73.171
    case FirstChorus1_4 = 75.723
    case FirstChorus2_1 = 78.241
    case FirstChorus2_2 = 80.740
    case FirstChorus2_3 = 83.284
    case FirstChorus2_4 = 85.509

    case SecondHits1 = 88.275
    case SecondHits2 = 89.010
    case SecondHits3 = 89.764
    case SecondHits4 = 90.065
    case SecondHits5 = 90.384

    case SecondVerse1_1 = 90.674
    case SecondVerse1_2 = 95.673
    case SecondVerse1_3 = 100.725
    case SecondVerse1_4 = 105.784
    case SecondVerse2_1 = 110.814
    case SecondVerse2_2 = 113.380
    case SecondVerse2_3 = 115.568
    case SecondVerse2_4 = 118.453
    case SecondVerse2_5 = 120.928
    case SecondVerse2_6 = 123.473
    case SecondVerse2_7 = 125.803
    case SecondVerse2_8 = 128.513

    case Bridge1_1 = 131.038
    case Bridge1_2 = 133.749
    case Bridge1_3 = 136.336
    case Bridge1_4 = 138.985
    case Bridge2_1 = 141.581
    case Bridge2_2 = 144.109
    case Bridge2_3 = 146.695
    case Bridge2_4 = 149.233

    case ThirdHits1 = 151.706
    case ThirdHits2 = 152.450
    case ThirdHits3 = 153.215
    case ThirdHits4 = 153.523
    case ThirdHits5 = 153.776

    case Buildup1 = 154.758
    case Buildup2 = 159.382
    case Buildup3 = 169.797
    case Buildup4 = 180.270
    case Buildup5 = 190.983

    case BassSolo = 200.314

    case LastChorus1_1 = 201.644
    case LastChorus1_2 = 204.265
    case LastChorus1_3 = 206.799
    case LastChorus1_4 = 209.358
    case LastChorus2_1 = 211.861
    case LastChorus2_2 = 214.441
    case LastChorus2_3 = 216.986
    case LastChorus2_4 = 219.517
    case LastChorus3_1 = 222.072
    case LastChorus3_2 = 224.659
    case LastChorus3_3 = 227.172
    case LastChorus3_4 = 229.738
    case LastChorus4_1 = 232.238
    case LastChorus4_2 = 234.807
    case LastChorus4_3 = 237.366
    case LastChorus4_4 = 239.907

    case LastHits1 = 242.372
    case LastHits2 = 243.120
    case LastHits3 = 243.916
    case LastHits4 = 244.259
    case LastHits5 = 244.581

    static let allValues = [
        Beginning,
        Organ,

        FirstHits1,
        FirstHits2,
        FirstHits3,
        FirstHits4,
        FirstHits5,

        Intro1_1,
        Intro1_2,
        Intro1_3,
        Intro1_4,
        Intro2_1,
        Intro2_2,
        Intro2_3,
        Intro2_4,

        FirstVerse1_1,
        FirstVerse1_2,
        FirstVerse2_1,
        FirstVerse2_2,

        FirstChorus1_1,
        FirstChorus1_2,
        FirstChorus1_3,
        FirstChorus1_4,
        FirstChorus2_1,
        FirstChorus2_2,
        FirstChorus2_3,
        FirstChorus2_4,

        SecondHits1,
        SecondHits2,
        SecondHits3,
        SecondHits4,
        SecondHits5,

        SecondVerse1_1,
        SecondVerse1_2,
        SecondVerse1_3,
        SecondVerse1_4,
        SecondVerse2_1,
        SecondVerse2_2,
        SecondVerse2_3,
        SecondVerse2_4,
        SecondVerse2_5,
        SecondVerse2_6,
        SecondVerse2_7,
        SecondVerse2_8,

        Bridge1_1,
        Bridge1_2,
        Bridge1_3,
        Bridge1_4,
        Bridge2_1,
        Bridge2_2,
        Bridge2_3,
        Bridge2_4,

        ThirdHits1,
        ThirdHits2,
        ThirdHits3,
        ThirdHits4,
        ThirdHits5,

        Buildup1,
        Buildup2,
        Buildup3,
        Buildup4,
        Buildup5,

        BassSolo,

        LastChorus1_1,
        LastChorus1_2,
        LastChorus1_3,
        LastChorus1_4, 
        LastChorus2_1, 
        LastChorus2_2, 
        LastChorus2_3, 
        LastChorus2_4, 
        LastChorus3_1, 
        LastChorus3_2, 
        LastChorus3_3, 
        LastChorus3_4, 
        LastChorus4_1, 
        LastChorus4_2, 
        LastChorus4_3, 
        LastChorus4_4, 
        
        LastHits1, 
        LastHits2, 
        LastHits3, 
        LastHits4, 
        LastHits5,
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
