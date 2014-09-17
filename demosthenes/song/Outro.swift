
import SceneKit

extension MainViewController {

	func Outro(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            scene.setSkybox("purplenebula")
            leftOverlay.geometry!.firstMaterial = SCNMaterial(cubeMap: "starfield", transparency: 0.5)
            rightOverlay.geometry!.firstMaterial = SCNMaterial(cubeMap: "starfield", transparency: 0.5)
            rightOverlay.removeFromParentNode()
            glitchPlane1.removeFromParentNode()
    		break
    		
    	case 1:
    		break
    		
    	case 2:
    		break
    		
	    default:
	    	break
	    }
    	
    	SCNTransaction.commit()
    }
}
