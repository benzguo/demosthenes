
import SceneKit
import AVFoundation

extension MainViewController {

	func Preverse1(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            scene.setSkybox("desertplains")

            let url = NSBundle.mainBundle().URLForResource("movie2", withExtension: "mov")
            let player = AVPlayer(URL: url)
            player.actionAtItemEnd = .None
            player.muted = true
            player.play()



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
