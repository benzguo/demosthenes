
import SceneKit

extension MainViewController {

	func Chorus1(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            scene.setSkybox("clouds")
            cameraNode.addChildNode(agave)
            agave.setRotation(vector: SCNVector3Make(1, 0, 0), duration: 200.0)
            cameraNode.addChildNode(cubetree)
            cameraNode.addChildNode(taco)
            cameraNode.addChildNode(taco2)
            cameraNode.addChildNode(glitchPlane1)
    		break
    		
    	case 1:
    		break
    		
    	case 2:
    		break
    		
    	case 3:
    		break
    		
	    default:
	    	break
	    }
    	
    	SCNTransaction.commit()
    }
}
