
import SceneKit

extension MainViewController {

	func Verse1(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 1:
            setSkybox("desertsky")
    		break
    		
    	case 2:
            setSkybox("desertstorm")
    		break
    		
    	case 3:
            setSkybox("desertsky")
    		break
    		
    	case 4:
            setSkybox("desertstorm")
    		break
    		
    	case 5:
            setSkybox("desertsky")
    		break
    		
	    default:
	    	break
	    }
    	
    	SCNTransaction.commit()
    }
}
