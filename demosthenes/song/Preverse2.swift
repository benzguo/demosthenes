
import SceneKit

extension MainViewController {

	func Preverse2(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            glitchPlane1.removeFromParentNode()
            glitchPlane2.removeFromParentNode()
            agave.removeFromParentNode()
            setSkybox("bleached")
            let leftMaterial = SCNMaterial(cubeMap: "bleached")
            leftMaterial.transparency = 0.7
            leftOverlay.geometry!.firstMaterial! = leftMaterial
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
