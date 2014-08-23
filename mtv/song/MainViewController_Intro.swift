import SceneKit

public var mysteryCubeKey = "mysteryCube"

extension MainViewController {

    func Organ() {
//        SCNTransaction.begin()
//        SCNTransaction.setAnimationDuration(20.0)


        rootNode.setRotation(vector: SCNVector3Make(1.0, 1.0, 1.0), duration: 100.0)

        // objects
        let box = SCNBox(size: 80.0)
        box.firstMaterial = SCNMaterial(cubeMap: "greywash")
        box.widthSegmentCount = 100
        box.lengthSegmentCount = 100
        let mysteryCube = SCNNode(geometry: box)
        mysteryCube.rotate(M_PI/2.0, x: 1, y: 0, z: 0)
        mysteryCube.setRotation(vector: SCNVector3Make(1, 0.5, 0), duration: 10.0)

        let shader = ShaderManager.shaderNamed("bumps_geom")
        mysteryCube.geometry.firstMaterial.shaderModifiers = [
            SCNShaderModifierEntryPointGeometry: shader
        ]
        self.saveNode(mysteryCube, withKey: &mysteryCubeKey)
        rootNode.addChildNode(mysteryCube)

//        SCNTransaction.commit()
    }

    func Intro(index: Int) {
        switch index {
        case 1:
            let sphere = SCNSphere(radius: 50)
            sphere.segmentCount = 150

            let virusNode = SCNNode(geometry: sphere)
            virusNode.position = SCNVector3Make(3, 6, 0);

            rootNode.addChildNode(virusNode)

            let geometryShader = ShaderManager.shaderNamed("bumps_geom") // bumps
            let surfaceShader = ShaderManager.shaderNamed("greenoil_surf") // oil
            let lightingShader = ShaderManager.shaderNamed("glow_light") // glow
            let fragmentShader = ShaderManager.shaderNamed("video_frag") // television
            virusNode.geometry.firstMaterial.shaderModifiers = [
                SCNShaderModifierEntryPointGeometry: geometryShader,
                SCNShaderModifierEntryPointSurface: surfaceShader,
                SCNShaderModifierEntryPointLightingModel: lightingShader,
                SCNShaderModifierEntryPointFragment: fragmentShader
            ]


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
