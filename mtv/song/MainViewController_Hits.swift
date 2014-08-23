
import SceneKit


extension MainViewController {

    func FirstHits(index: Int) {
        SCNTransaction.begin()

        switch index {
        case 1:
            let mysteryCube = self.nodeForKey(&mysteryCubeKey)
            mysteryCube.removeFromParentNode()
            rootNode.stopRotation()
            setSkybox("desert")
        case 2:
            setSkybox("endset")
        case 3:
            setSkybox("desert_evening")
        case 4:
            setSkybox("desertstorm")
        case 5:
            setSkybox("desertsky")
        default:
            break
        }

        SCNTransaction.commit()
    }

    func SecondHits(index: Int) {
        SCNTransaction.begin()

        switch index {
        case 1:
            setSkybox("desert")
        case 2:
            setSkybox("endset")
        case 3:
            setSkybox("desert_evening")
        case 4:
            setSkybox("desertstorm")
        case 5:
            setSkybox("desertsky")
        default:
            break
        }

        SCNTransaction.commit()
    }

    func ThirdHits(index: Int) {
        SCNTransaction.begin()

        switch index {
        case 1:
            setSkybox("desert")
        case 2:
            setSkybox("endset")
        case 3:
            setSkybox("desert_evening")
        case 4:
            setSkybox("desertstorm")
        case 5:
            setSkybox("desertsky")
        default:
            break
        }
        
        SCNTransaction.commit()
    }
    
    func LastHits(index: Int) {
        SCNTransaction.begin()

        switch index {
        case 1:
            setSkybox("desert")
        case 2:
            setSkybox("endset")
        case 3:
            setSkybox("desert_evening")
        case 4:
            setSkybox("desertstorm")
        case 5:
            setSkybox("desertsky")
        default:
            break
        }

        SCNTransaction.commit()
    }
    
}
