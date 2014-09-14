
import SceneKit

extension MainViewController {

	func Chorus1(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            setSkybox("clouds")
            starBox.removeFromParentNode()
            cameraNode.addChildNode(glitchPlane1)
//            cameraNode.addChildNode(glitchPlane2)
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
