
import SceneKit

extension MainViewController {

	func Preverse2(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            setSkybox("desertstorm")
            floor.setFragmentShader("video_frag")           
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
