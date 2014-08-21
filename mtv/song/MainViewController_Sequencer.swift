import SceneKit

extension MainViewController {

    // MARK: SCNSceneRendererDelegate
    func renderer(aRenderer: SCNSceneRenderer!, willRenderScene scene: SCNScene!, atTime time: NSTimeInterval) {
        let time = NSDate().timeIntervalSinceDate(startTime)
        if isnan(time) {
            return
        }
        if time >= song.nextEvent.toRaw() {
            song.step()
            let event = song.currentEvent
            switch event {
            case .Organ:
                Organ()

            case .FirstHits1, .FirstHits2, .FirstHits3, .FirstHits4, .FirstHits5:
                FirstHits(event)

            case .Intro1_1, .Intro1_2, .Intro1_3, .Intro1_4,
            .Intro2_1, .Intro2_2, .Intro2_3, .Intro2_4:
                Intro(event)

            case .FirstVerse1_1, .FirstVerse1_2, .FirstVerse2_1, .FirstVerse2_2:
                FirstVerse(event)

            case .FirstChorus1_1, .FirstChorus1_2, .FirstChorus1_3, .FirstChorus1_4,
            .FirstChorus2_1, .FirstChorus2_2, .FirstChorus2_3, .FirstChorus2_4:
                FirstChorus(event)

            case .SecondHits1, .SecondHits2, .SecondHits3, .SecondHits4, .SecondHits5:
                SecondHits(event)

            case .SecondVerse1_1, .SecondVerse1_2, .SecondVerse1_3, .SecondVerse1_4,
            .SecondVerse2_1, .SecondVerse2_2, .SecondVerse2_3, .SecondVerse2_4,
            .SecondVerse2_5, .SecondVerse2_6, .SecondVerse2_7, .SecondVerse2_8:
                SecondVerse(event)

            case .Bridge1_1, .Bridge1_2, .Bridge1_3, .Bridge1_4,
            .Bridge2_1, .Bridge2_2, .Bridge2_3, .Bridge2_4:
                Bridge(event)

            case .ThirdHits1, .ThirdHits2, .ThirdHits3, .ThirdHits4, .ThirdHits5:
                ThirdHits(event)

            case .Buildup1, .Buildup2, .Buildup3, .Buildup4, .Buildup5:
                Buildup(event)

            case .BassSolo:
                BassSolo()

            case .LastChorus1_1, .LastChorus1_2, .LastChorus1_3, .LastChorus1_4,
            .LastChorus2_1, .LastChorus2_2, .LastChorus2_3, .LastChorus2_4,
            .LastChorus3_1, .LastChorus3_2, .LastChorus3_3, .LastChorus3_4,
            .LastChorus4_1, .LastChorus4_2, .LastChorus4_3, .LastChorus4_4:
                LastChorus(event)
            case .LastHits1, .LastHits2, .LastHits3, .LastHits4, .LastHits5:
                LastHits(event)

            default:
                break
            }
        }
    }
}