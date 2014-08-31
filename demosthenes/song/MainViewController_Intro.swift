import SceneKit

public var mysteryCubeKey = "mysteryCube"
public var introCubeKey = "introCube"

extension MainViewController {

    func Organ() {
        SCNTransaction.begin()
        rootNode.setRotation(vector: SCNVector3Make(1.0, 1.0, 1.0), duration: 100.0)

        let box = SCNBox(size: 80.0)
        box.firstMaterial = SCNMaterial(cubeMap: "greywash")
        box.lengthSegmentCount = 10
        box.widthSegmentCount = 10
        let mysteryCube = SCNNode(geometry: box)
        mysteryCube.rotate(M_PI/2.0, x: 1, y: 0, z: 0)
        mysteryCube.setRotation(vector: SCNVector3Make(1, 0.5, 0), duration: 10.0)
        mysteryCube.setGeometryShader("bumps_geom")
        rootNode.addChildNode(mysteryCube)
        self.saveNode(mysteryCube, withKey: &mysteryCubeKey)

        floor.setFragmentShader("video_frag")


       

//        let animation = CABasicAnimation(keyPath: "filters.px.inputScale")
//        animation.toValue = 50
//        animation.fromValue = 0
//        animation.autoreverses = true
//        animation.repeatCount = FLT_MAX
//        animation.duration = 2.0
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        rootNode.addAnimation(animation, forKey: "pixellateAnimation")

        SCNTransaction.commit()
    }

    func Intro(index: Int) {
        SCNTransaction.begin()
        switch index {
        case 1:


            let cube = SCNBox(size: 50)
            let introCube = SCNNode(geometry: cube)
            introCube.setRotation(vector: SCNVector3Make(1, 0.5, 0), duration: 10.0)
            introCube.setSurfaceShader("greenoil_surf")

            let pixellateFilter = CIFilter(name: "CIPixellate")
            pixellateFilter.setDefaults()
            pixellateFilter.setValue(20, forKey: "inputScale")
            pixellateFilter.name = "px"

            introCube.filters = [pixellateFilter]
            self.saveNode(introCube, withKey: &introCubeKey)
            rootNode.addChildNode(introCube)


        case 2:

            let introCube = self.nodeForKey(&introCubeKey)
            introCube.setFragmentShader("video_frag")
            introCube.filters = []


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
        SCNTransaction.commit()
    }

}
