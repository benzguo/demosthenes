
import SceneKit

extension MainViewController {

	func Preverse1(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            print("case 0")
            setSkybox("desert")
    		break
    		
    	case 1:
            print("case 1")
            setSkybox("desertstorm")
    		break
    		
	    default:
            print("default")
	    	break
	    }
    	
    	SCNTransaction.commit()
    }
}
