import Cocoa
import SceneKit

class MainViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

    override func awakeFromNib() {
        var sceneView: SCNView = self.view as SCNView
        sceneView.backgroundColor = NSColor.grayColor()
        sceneView.scene = SCNScene()
        let rootNode = sceneView.scene.rootNode

        let cameraNode = SCNNode()
        let camera = SCNCamera()
        camera.xFov = 45 // increase for wide angle
        camera.yFov = 45
        cameraNode.camera = camera
        cameraNode.position = SCNVector3Make(0, 0, 30)
        rootNode.addChildNode(cameraNode)

        // lights
        let ambientLight = SCNLight()
        ambientLight.type = SCNLightTypeAmbient
        ambientLight.color = NSColor(deviceWhite: 0.1, alpha: 1.0)
        let ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight
        rootNode.addChildNode(ambientLightNode)

        let diffuseLight = SCNLight()
        diffuseLight.type = SCNLightTypeOmni
        let diffuseLightNode = SCNNode()
        diffuseLightNode.light = diffuseLight
        diffuseLightNode.position = SCNVector3Make(-30, 30, 50)
        rootNode.addChildNode(diffuseLightNode)

        let flatShinyMaterial = SCNMaterial()
        let cubeMap = [
            NSImage(named: "darkland-right.jpg"),
            NSImage(named: "darkland-left.jpg"),
            NSImage(named: "darkland-top.jpg"),
            NSImage(named: "darkland-bottom.jpg"),
            NSImage(named: "darkland-back.jpg"),
            NSImage(named: "darkland-front.jpg"),
        ]
        flatShinyMaterial.reflective.contents = cubeMap
        flatShinyMaterial.shininess = 100
        flatShinyMaterial.diffuse.contents = NSColor.blackColor()
        flatShinyMaterial.specular.contents = NSColor.whiteColor()       

        // floor (not showing)
        let floor = SCNFloor()
        floor.reflectionFalloffEnd = 100
        floor.firstMaterial.diffuse.contents = NSImage(named: "floor-diffuse.jpg")
        floor.firstMaterial.diffuse.contentsTransform = CATransform3DMakeScale(0.4, 0.4, 0.4);
        let floorNode = SCNNode(geometry: floor)
        rootNode.addChildNode(floorNode)

        // not used
        let colorAnimation = CAKeyframeAnimation(keyPath: "color")
        colorAnimation.values = [
            NSColor.redColor(),
            NSColor.blueColor(),
            NSColor.greenColor(),
            NSColor.redColor()
        ]
        colorAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        colorAnimation.repeatCount = Float.infinity
        colorAnimation.duration = 3.0       

        let cube = SCNBox(width: 4.0, height: 4.0, length: 4.0, chamferRadius: 0.0)
        cube.materials = [flatShinyMaterial]
        let cubeNode = SCNNode(geometry: cube)
        rootNode.addChildNode(cubeNode)

        let cubeAnimation = CABasicAnimation(keyPath: "rotation")
        cubeAnimation.byValue = NSValue(SCNVector4: SCNVector4Make(1.0, 1.0, 0, 2.0*CGFloat(M_PI)))
        cubeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        cubeAnimation.repeatCount = Float.infinity
        cubeAnimation.duration = 5.0
        cubeNode.addAnimation(cubeAnimation, forKey: "rotation")

        let sphere = SCNSphere(radius: 0.5)
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = SCNVector3Make(3.0, 0.0, 0.0)
        rootNode.addChildNode(sphereNode)

        let torus = SCNTorus(ringRadius: 8, pipeRadius: 1)
        let torusNode = SCNNode(geometry: torus)
        let rotationTransform = CATransform3DMakeRotation(CGFloat(M_PI/2.0), CGFloat(1), CGFloat(0), CGFloat(0))
        torusNode.transform = rotationTransform


        torus.materials = [flatShinyMaterial]
        rootNode.addChildNode(torusNode)


        let torusRotation = CAKeyframeAnimation(keyPath: "transform")
        torusRotation.values = [
            NSValue(CATransform3D: CATransform3DRotate(torusNode.transform, 0 * CGFloat(M_PI)/2.0, 1, 0.5, 0)),
            NSValue(CATransform3D: CATransform3DRotate(torusNode.transform, 1 * CGFloat(M_PI)/2.0, 1, 0.5, 0)),
            NSValue(CATransform3D: CATransform3DRotate(torusNode.transform, 2 * CGFloat(M_PI)/2.0, 1, 0.5, 0)),
            NSValue(CATransform3D: CATransform3DRotate(torusNode.transform, 3 * CGFloat(M_PI)/2.0, 1, 0.5, 0)),
            NSValue(CATransform3D: CATransform3DRotate(torusNode.transform, 4 * CGFloat(M_PI)/2.0, 1, 0.5, 0))
        ]
        torusRotation.duration = 3.0
        torusRotation.repeatCount = Float.infinity
        torusNode.addAnimation(torusRotation, forKey: "transform")

        let text = SCNText(string: "☛", extrusionDepth: 4.0)
        let textNode = SCNNode(geometry: text)
        textNode.position = SCNVector3Make(-1, 2, 0)
        textNode.transform = CATransform3DScale(textNode.transform, 0.1, 0.1, 0.1)
        cubeNode.addChildNode(textNode)

    }

}
