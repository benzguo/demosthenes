
import SceneKit

extension MainViewController {

	func Verse1(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            setSkybox("orangecream")
            floorNode.removeFromParentNode()


    		break
    		
    	case 1:
    		break
    		
    	case 2:
    		break
    		
    	case 3:
    		break
    		
    	case 4:
    		break
    		
	    default:
	    	break
	    }
    	
    	SCNTransaction.commit()
    }
}
