
import SceneKit

extension MainViewController {

	func Preverse2(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            setSkybox("desertstorm")
    		break
    		
    	case 1:
            setSkybox("desertplains")
    		break
    		
	    default:
	    	break
	    }
    	
    	SCNTransaction.commit()
    }
}
