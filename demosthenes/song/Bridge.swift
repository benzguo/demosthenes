
import SceneKit

extension MainViewController {

	func Bridge(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            cameraNode.addChildNode(fullOverlay)
            scene.setSkybox("purplenebula")
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "zx_redbody", transparency: 0.3)
            fullOverlay.setFragmentShader("video_frag")
            leftOverlay.geometry!.firstMaterial = SCNMaterial(cubeMap: "starfield", transparency: 0.5)
            leftOverlay.setFragmentShader("video_frag")
            rightOverlay.geometry!.firstMaterial = SCNMaterial(cubeMap: "starfield", transparency: 0.5)
            rightOverlay.setFragmentShader("video_frag")
    		break
    		
    	case 1:
    		break
    		
    	case 2:
    		break
    		
    	case 3:
    		break
    		
    	case 4:
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
