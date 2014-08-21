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

    func Intro(event: Event) {
        switch event {
        case .Intro1_1:
            break
        case .Intro1_2:
            break
        case .Intro1_3:
            break
        case .Intro1_4:
            break
        case .Intro2_1:
            break
        case .Intro2_2:
            break
        case .Intro2_3:
            break
        case .Intro2_4:
            break
        default:
            break
        }
    }

}
