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


        SCNTransaction.commit()
    }

    func Intro(index: Int) {
        SCNTransaction.begin()
        switch index {
        case 1:
            let sphere = SCNSphere(radius: 50)

            let virusNode = SCNNode(geometry: sphere)
            virusNode.position = SCNVector3Make(3, 6, 0)
            virusNode.setSurfaceShader("greenoil_surf")

            rootNode.addChildNode(virusNode)


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
