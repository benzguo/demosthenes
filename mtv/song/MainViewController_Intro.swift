import SceneKit

public var mysteryCubeKey = "mysteryCube"

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


            let box = SCNBox(size: 50)
            let boxNode = SCNNode(geometry: box)
            boxNode.setRotation(vector: SCNVector3Make(1, 0.5, 0), duration: 10.0)
            boxNode.setSurfaceShader("greenoil_surf")

            let pixellateFilter = CIFilter(name: "CIPixellate")
            pixellateFilter.setDefaults()
            pixellateFilter.setValue(20, forKey: "inputScale")
            pixellateFilter.name = "px"

            boxNode.filters = [pixellateFilter]

            rootNode.addChildNode(boxNode)


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
        SCNTransaction.commit()
    }

}
