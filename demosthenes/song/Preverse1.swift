
import SceneKit
import AVFoundation

extension MainViewController {

	func Preverse1(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            cameraNode.setRotation(vector: SCNVector3Make(0, -1, 0), duration: 100.0)
            scene.setSkybox("purplenebula")
            fullOverlay.geometry!.firstMaterial = SCNMaterial(image: "sega_galaxy", transparency: 0.3)
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
