
import SceneKit
import AVFoundation

extension MainViewController {

	func Preverse1(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            cameraNode.setRotation(vector: SCNVector3Make(0, -1, 0), duration: 100.0)
            scene.setSkybox("orangecream")
            leftOverlay.geometry!.firstMaterial = SCNMaterial(cubeMap: "desertstorm", transparency: 0.5)
            rightOverlay.geometry!.firstMaterial = SCNMaterial(cubeMap: "desertplains", transparency: 0.5)

    		break

    	case 1:
            leftOverlay.geometry!.firstMaterial = SCNMaterial(cubeMap: "desertplains", transparency: 0.5)
            rightOverlay.geometry!.firstMaterial = SCNMaterial(cubeMap: "desertstorm", transparency: 0.5)
    		break

	    default:
	    	break
	    }

    	SCNTransaction.commit()
    }
}
