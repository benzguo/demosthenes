
import SceneKit

extension MainViewController {

	func Chorus3(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "sega_rain", transparency: 0.1)
            fullOverlay.setFragmentShader("video_frag")
    		break
    		
    	case 1:
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "atari_greyglitch", transparency: 0.1)
            fullOverlay.setFragmentShader("video_frag")
    		break
    		
    	case 2:
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "bernini_daphne_front", transparency: 0.15)
            fullOverlay.setFragmentShader("video_frag")
    		break
    		
    	case 3:
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "bernini_daphne_top", transparency: 0.2)
            fullOverlay.setFragmentShader("video_frag")
    		break
    		
    	case 4:
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "sega_marilyndiptych", transparency: 0.1)
            fullOverlay.setFragmentShader("video_frag")           
    		break
    		
    	case 5:
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "bernini_daphne_black", transparency: 0.2)
            fullOverlay.setFragmentShader("video_frag")
    		break
    		
    	case 6:
    		break
    		
	    default:
	    	break
	    }
    	
    	SCNTransaction.commit()
    }
}
