
import SceneKit

extension MainViewController {

     func FirstHits(event: Event) {
        SCNTransaction.begin()

        switch event {
        case .FirstHits1:
            mysteryCube.removeFromParentNode()
            rootNode.stopRotation()
            scene.setSkybox("desert")
        case .FirstHits2:
            scene.setSkybox("endset")
        case .FirstHits3:
            scene.setSkybox("desert_evening")
        case .FirstHits4:
            scene.setSkybox("desertstorm")
        case .FirstHits5:
            scene.setSkybox("desertsky")
        default:
            break
        }

        SCNTransaction.commit()
    }

    func SecondHits(event: Event) {
        SCNTransaction.begin()

        switch event {
        case .SecondHits1:
            scene.setSkybox("desert")
        case .SecondHits2:
            scene.setSkybox("endset")
        case .SecondHits3:
            scene.setSkybox("desert_evening")
        case .SecondHits4:
            scene.setSkybox("desertstorm")
        case .SecondHits5:
            scene.setSkybox("desertsky")
        default:
            break
        }

        SCNTransaction.commit()
    }

    func ThirdHits(event: Event) {
        SCNTransaction.begin()

        switch event {
        case .ThirdHits1:
            scene.setSkybox("desert")
        case .ThirdHits2:
            scene.setSkybox("endset")
        case .ThirdHits3:
            scene.setSkybox("desert_evening")
        case .ThirdHits4:
            scene.setSkybox("desertstorm")
        case .ThirdHits5:
            scene.setSkybox("desertsky")
        default:
            break
        }

        SCNTransaction.commit()
    }

    func LastHits(event: Event) {
        SCNTransaction.begin()

        switch event {
        case .LastHits1:
            scene.setSkybox("desert")
        case .LastHits2:
            scene.setSkybox("endset")
        case .LastHits3:
            scene.setSkybox("desert_evening")
        case .LastHits4:
            scene.setSkybox("desertstorm")
        case .LastHits5:
            scene.setSkybox("desertsky")
        default:
            break
        }

        SCNTransaction.commit()
    }

}
