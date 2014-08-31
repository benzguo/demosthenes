
import SceneKit

extension MainViewController {

	func Preverse1(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            scene.setSkybox("desertplains")
            floor.setCubemap("desertstorm")
            floor.setFragmentShader("video_frag")
    		break
    		
    	case 1:
            scene.setSkybox("desertstorm")
            floor.setCubemap("desertplains")
    		break
    		
	    default:
	    	break
	    }
    	
    	SCNTransaction.commit()
    }
}
