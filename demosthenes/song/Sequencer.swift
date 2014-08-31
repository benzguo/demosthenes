
import SceneKit
public enum Section: Int {
    case Preverse1 = 0
    case Verse1
    case Prechorus1
    case Chorus1
    case Preverse2
    case Verse2
    case Prechorus2
    case Bridge
    case Chorus2
    case Chorus3
    case Outro

static let eventsTable: [[Double]] = 
[
    [10.245, 19.021],
    [27.902, 32.313, 38.917, 45.511, 54.407],
    [63.194, 71.975],
    [80.882, 89.809, 98.669, 107.638],
    [116.513, 125.503],
    [134.43, 139.013, 145.545, 152.316, 161.264],
    [170.097, 178.978],
    [187.853, 192.259, 196.723, 201.155, 205.561, 207.765, 208.598],
    [210.009, 214.499, 218.947, 223.536, 227.843, 232.265, 236.765, 241.177, 245.63, 250.005, 254.479, 259.026, 263.307, 267.808, 272.24, 276.636],
    [281.053, 289.787, 298.621, 307.449, 316.215, 324.97, 329.324],
    [333.71, 344.45, 346.34],
]

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

            case .Preverse1:
            	Preverse1(index)

            case .Verse1:
            	Verse1(index)

            case .Prechorus1:
            	Prechorus1(index)

            case .Chorus1:
            	Chorus1(index)

            case .Preverse2:
            	Preverse2(index)

            case .Verse2:
            	Verse2(index)

            case .Prechorus2:
            	Prechorus2(index)

            case .Bridge:
            	Bridge(index)

            case .Chorus2:
            	Chorus2(index)

            case .Chorus3:
            	Chorus3(index)

            case .Outro:
            	Outro(index)

            default:
                break
            }
        }
    }
}
