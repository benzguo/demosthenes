
import SceneKit

extension MainViewController {

    func FirstHits(index: Int) {
        SCNTransaction.begin()

        switch index {
        case 1:
            mysteryCube.removeFromParentNode()
            rootNode.stopRotation()
            scene.setSkybox("desert")
        case 2:
            scene.setSkybox("endset")
        case 3:
            scene.setSkybox("desert_evening")
        case 4:
            scene.setSkybox("desertstorm")
        case 5:
            scene.setSkybox("desertsky")
        default:
            break
        }

        SCNTransaction.commit()
    }

    func SecondHits(index: Int) {
        SCNTransaction.begin()

        switch index {
        case 1:
            scene.setSkybox("desert")
        case 2:
            scene.setSkybox("endset")
        case 3:
            scene.setSkybox("desert_evening")
        case 4:
            scene.setSkybox("desertstorm")
        case 5:
            scene.setSkybox("desertsky")
        default:
            break
        }

        SCNTransaction.commit()
    }

    func ThirdHits(index: Int) {
        SCNTransaction.begin()

        switch index {
        case 1:
            scene.setSkybox("desert")
        case 2:
            scene.setSkybox("endset")
        case 3:
            scene.setSkybox("desert_evening")
        case 4:
            scene.setSkybox("desertstorm")
        case 5:
            scene.setSkybox("desertsky")
        default:
            break
        }
        
        SCNTransaction.commit()
    }
    
    func LastHits(index: Int) {
        SCNTransaction.begin()

        switch index {
        case 1:
            scene.setSkybox("desert")
        case 2:
            scene.setSkybox("endset")
        case 3:
            scene.setSkybox("desert_evening")
        case 4:
            scene.setSkybox("desertstorm")
        case 5:
            scene.setSkybox("desertsky")
        default:
            break
        }

        SCNTransaction.commit()
    }
    
}
