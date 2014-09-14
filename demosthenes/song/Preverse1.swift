
import SceneKit
import AVFoundation

extension MainViewController {

	func Preverse1(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            scene.setSkybox("desertplains")
    		break

    	case 1:
            scene.setSkybox("desertstorm")
    		break

	    default:
	    	break
	    }

    	SCNTransaction.commit()
    }
}
