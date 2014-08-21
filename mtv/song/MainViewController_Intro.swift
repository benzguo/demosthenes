import SceneKit

extension MainViewController {

    func Organ() {
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(10.0)
        camera.aperture = 1.0
        cameraNode.position = SCNVector3Make(0, 30, 150)
        rootNode.setRotation(vector: SCNVector3Make(1.0, 1.0, 1.0), duration: 100.0)
        SCNTransaction.commit()
    }

    func Intro(index: Int) {
        switch index {
        case 1:
            break
        case 2:
            break
        case 3:
            break
        case 4:
            break
        case 5:
            break
        case 6:
            break
        case 7:
            break
        case 8:
            break
        default:
            break
        }
    }

}
