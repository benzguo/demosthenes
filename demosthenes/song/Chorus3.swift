
import SceneKit

extension MainViewController {

	func Chorus3(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "bernini_daphne_back", transparency: 0.2)
            fullOverlay.setFragmentShader("video_frag")
            fullOverlay.setGeometryShader("bumps_geom1")
    		break
    		
    	case 1:
    		break
    		
    	case 2:
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "bernini_daphne_top", transparency: 0.2)
            fullOverlay.setFragmentShader("video_frag")
            fullOverlay.setGeometryShader("bumps_geom1")
    		break
    		
    	case 3:
    		break
    		
    	case 4:
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "bernini_daphne_black", transparency: 0.2)
            fullOverlay.setFragmentShader("video_frag")
            fullOverlay.setGeometryShader("bumps_geom1")
    		break
    		
    	case 5:
    		break
    		
    	case 6:
    		break
    		
	    default:
	    	break
	    }
    	
    	SCNTransaction.commit()
    }
}
