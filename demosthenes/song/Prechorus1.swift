
import SceneKit

extension MainViewController {

	func Prechorus1(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            setSkybox("orangecream")
            cameraNode.addChildNode(agave)
    		break
    		
    	case 1:
    		break
    		
	    default:
	    	break
	    }
    	
    	SCNTransaction.commit()
    }
}
