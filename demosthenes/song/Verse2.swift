
import SceneKit

extension MainViewController {

	func Verse2(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            scene.setSkybox("orangecream")
            fullOverlay.removeFromParentNode()
            leftOverlay.geometry!.firstMaterial = SCNMaterial(cubeMap: "desertplains", transparency: 0.4)
            rightOverlay.geometry!.firstMaterial = SCNMaterial(cubeMap: "desertstorm", transparency: 0.4)
    		break
    		
    	case 1:
    		break
    		
    	case 2:
    		break
    		
    	case 3:
    		break
    		
    	case 4:
    		break
    		
	    default:
	    	break
	    }
    	
    	SCNTransaction.commit()
    }
}
