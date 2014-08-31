
import SceneKit

extension MainViewController {

	func Prechorus1(index: Int) {
	    SCNTransaction.begin()

	    switch index {
    	case 0:
            rootNode.addChildNode(floorNode)
    		break
    		
    	case 1:
    		break
    		
	    default:
	    	break
	    }
    	
    	SCNTransaction.commit()
    }
}
