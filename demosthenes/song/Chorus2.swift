
import SceneKit

extension MainViewController {

	func Chorus2(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            scene.setSkybox("clouds")
            cameraNode.addChildNode(agave)
            agave.setRotation(vector: SCNVector3Make(1, 0, 0), duration: 800.0)
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "sega_rain", transparency: 0.15)
            fullOverlay.setFragmentShader("video_frag")
            leftOverlay.geometry!.firstMaterial = SCNMaterial(cubeMap: "desertplains", transparency: 0.4)
            leftOverlay.setFragmentShader("video_frag")
            rightOverlay.geometry!.firstMaterial = SCNMaterial(cubeMap: "desertstorm", transparency: 0.4)
            rightOverlay.setFragmentShader("video_frag")
            cameraNode.addChildNode(glitchPlane1)
            cameraNode.addChildNode(glitchPlane2)
    		break
    		
    	case 1:
    		break
    		
    	case 2:

    		break
    		
    	case 3:
    		break
    		
    	case 4:
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "sega_pinewoods", transparency: 0.15)
            fullOverlay.setFragmentShader("video_frag")           
    		break
    		
    	case 5:
    		break
    		
    	case 6:
    		break
    		
    	case 7:
    		break
    		
    	case 8:
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "sega_rain", transparency: 0.15)
            fullOverlay.setFragmentShader("video_frag")           
    		break
    		
    	case 9:
    		break
    		
    	case 10:
    		break
    		
    	case 11:
    		break
    		
    	case 12:
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "sega_pinewoods", transparency: 0.15)
            fullOverlay.setFragmentShader("video_frag")
    		break
    		
    	case 13:
    		break
    		
    	case 14:
    		break
    		
    	case 15:
    		break
    		
	    default:
	    	break
	    }
    	
    	SCNTransaction.commit()
    }
}
