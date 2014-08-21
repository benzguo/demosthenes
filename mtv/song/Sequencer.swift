import SceneKit

public enum Section: Int {
    case Start = 0
    case Organ
    case FirstHits
    case Intro
    case FirstVerse
    case FirstChorus
    case SecondHits
    case SecondVerse
    case Bridge
    case ThirdHits
    case Buildup
    case BassSolo
    case LastChorus
    case LastHits

    func events() -> [Double] {
        return Section.eventsTable[self.toRaw()]
    }

    static let eventsTable: [[Double]] =
    [
        [ 0 ],
        [ 0.47 ],
        [
            6.019,
            6.799,
            7.534,
            7.836,
            8.119,
        ],
        [
            8.438,
            10.867,
            13.322,
            15.786,
            18.189,
            20.670,
            23.117,
            25.581,
        ],
        [
            28.018,
            37.999,
            47.971,
            57.987,
        ],
        [
            67.985,
            70.591,
            73.171,
            75.723,
            78.241,
            80.740,
            83.284,
            85.509,
        ],
        [
            88.275,
            89.010,
            89.764,
            90.065,
            90.384,
        ],
        [
            90.674,
            95.673,
            100.725,
            105.784,
            110.814,
            113.380,
            115.568,
            118.453,
            120.928,
            123.473,
            125.803,
            128.513,
        ],
        [
            131.038,
            133.749,
            136.336,
            138.985,
            141.581,
            144.109,
            146.695,
            149.233,
        ],
        [
            151.706,
            152.450,
            153.215,
            153.523,
            153.776,
        ],
        [
            154.758,
            159.382,
            169.797,
            180.270,
            190.983,
        ],
        [ 200.314 ],
        [
            201.644,
            204.265,
            206.799,
            209.358,
            211.861,
            214.441,
            216.986,
            219.517,
            222.072,
            224.659,
            227.172,
            229.738,
            232.238,
            234.807,
            237.366,
            239.907,
        ],
        [
            242.372,
            243.120,
            243.916,
            244.259,
            244.581,
        ],
    ]
}

extension MainViewController {

    // MARK: SCNSceneRendererDelegate
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
            case .Organ:
                Organ()

            case .FirstHits:
                FirstHits(index)

            case .Intro:
                Intro(index)

            case .FirstVerse:
                FirstVerse(index)

            case .FirstChorus:
                FirstChorus(index)

            case .SecondHits:
                SecondHits(index)

            case .SecondVerse:
                SecondVerse(index)

            case .Bridge:
                Bridge(index)

            case .ThirdHits:
                ThirdHits(index)

            case .Buildup:
                Buildup(index)

            case .BassSolo:
                BassSolo()

            case .LastChorus:
                LastChorus(index)

            case .LastHits:
                LastHits(index)

            default:
                break
            }
        }
    }
}