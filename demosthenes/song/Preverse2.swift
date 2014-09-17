
import SceneKit

extension MainViewController {

	func Preverse2(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            glitchPlane1.removeFromParentNode()
            glitchPlane2.removeFromParentNode()
            agave.removeFromParentNode()
            scene.setSkybox("purplenebula")
            cameraNode.addChildNode(fullOverlay)
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "sega_saturn", transparency: 0.3)
            fullOverlay.setFragmentShader("video_frag")
            leftOverlay.geometry!.firstMaterial = SCNMaterial(cubeMap: "starfield", transparency: 0.5)
            rightOverlay.geometry!.firstMaterial = SCNMaterial(cubeMap: "starfield", transparency: 0.5)
    		break
    		
    	case 1:
    		break
    		
	    default:
	    	break
	    }
    	
    	SCNTransaction.commit()
    }
}
