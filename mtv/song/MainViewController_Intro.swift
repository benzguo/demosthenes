import SceneKit

extension MainViewController {

    func Organ() {
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(20.0)
        camera.aperture = 1.0
        cameraNode.position = SCNVector3Make(0, 30, 150)
        rootNode.setRotation(vector: SCNVector3Make(1.0, 1.0, 1.0), duration: 100.0)
        SCNTransaction.commit()
    }

    func Intro(index: Int) {
        switch index {
        case 1:
            // Create a (very) tesselated plane
            let plane = SCNPlane(width: 100, height: 100)
            plane.widthSegmentCount = 200
            plane.heightSegmentCount = 200

            // Setup the material (same as the floor)
            plane.firstMaterial.diffuse.wrapS = .WrapModeMirror;
            plane.firstMaterial.diffuse.wrapT = .WrapModeMirror;
            plane.firstMaterial.diffuse.contents = "/Library/Desktop Pictures/Circles.jpg";
            plane.firstMaterial.diffuse.contentsTransform = CATransform3DScale(CATransform3DMakeRotation(CGFloat(M_PI / 4.0), 0, 0, 1), 0.5, 0.5, 1.0);
            plane.firstMaterial.specular.contents = NSColor.whiteColor()
            plane.firstMaterial.reflective.contents = NSImage(named: "tilednormal_envmap")
            plane.firstMaterial.reflective.intensity = 0.0;

            // Create a node to hold that plane
            let planeNode = SCNNode()
            planeNode.position = SCNVector3Make(0, 1, 0);
            planeNode.rotation = SCNVector4Make(1, 0, 0, CGFloat(-M_PI_2));
            planeNode.scale = SCNVector3Make(5, 5, 1);
            planeNode.geometry = plane;
            rootNode.addChildNode(planeNode)

            // Attach the "wave" shader modifier, and set an initial intensity value of 0
            let shaderPath = NSBundle.mainBundle().pathForResource("wave", ofType: "shader")
            let waveShader = NSString(contentsOfFile: shaderPath, encoding: NSUTF8StringEncoding, error: nil)
            planeNode.geometry.shaderModifiers = [ SCNShaderModifierEntryPointGeometry : waveShader ];
            planeNode.geometry.setValue(1.0, forKey: "intensity")

            // Progressively increase the intensity
            SCNTransaction.begin()
            SCNTransaction.setAnimationDuration(2)
            planeNode.geometry.setValue(1.0, forKey:"intensity")
            planeNode.geometry.firstMaterial.reflective.intensity = 0.3
            SCNTransaction.commit()

            sceneView.playing = true
            sceneView.loops = true

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
