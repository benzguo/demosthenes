
import SceneKit

extension MainViewController {

	func Verse1(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            scene.setSkybox("hazy_lake")
            let material = SCNMaterial(cubeMap: "hazy_lake")
            starBox.geometry!.firstMaterial = material


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
