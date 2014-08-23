import Cocoa
import SceneKit
import AVFoundation
import CoreMedia

class MainViewController: NSViewController, SCNSceneRendererDelegate {

    var sceneView: SCNView!
    var overlayScene: OverlayScene!
    let scene: SCNScene
    let rootNode: SCNNode
    let cursor: Cursor
    let audioPlayer: AVPlayer
    var startTime: NSDate?

    let camera: SCNCamera
    let cameraNode: SCNNode // used to move the camera relative to the global position (cameraHandle)
    let cameraHandle: SCNNode // used to control the global position in world space
    let cameraPitch: SCNNode // used to rotate the position around the x axis

    let ambientLight: SCNLight
    let ambientLightNode: SCNNode
    let omniLight: SCNLight
    let omniLightNode: SCNNode
    let floor: SCNFloor
    let floorNode: SCNNode

    let mysteryCube: SCNNode
    var sphereNode: SCNNode!

    required init(coder: NSCoder!) {
        // scene
        scene = SCNScene()
        rootNode = scene.rootNode

        // audio
        cursor = Cursor()
        audioPlayer = AVPlayer(aif: "Song In My Head")

        // cameras
        camera = SCNCamera()
        camera.xFov = 70.0 // increase for wide angle
        camera.yFov = 42.0
        cameraHandle = SCNNode()
        rootNode.addChildNode(cameraHandle)
        cameraPitch = SCNNode()
        cameraHandle.addChildNode(cameraPitch)
        cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3Make(0, 30, 90)
        cameraPitch.addChildNode(cameraNode)

        // lights
        ambientLight = SCNLight()
        ambientLight.type = SCNLightTypeAmbient
        ambientLight.color = NSColor(deviceWhite: 0.1, alpha: 1.0)
        ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight

        omniLight = SCNLight()
        omniLight.type = SCNLightTypeOmni
        omniLightNode = SCNNode()
        omniLightNode.light = omniLight
        omniLightNode.position = SCNVector3Make(0, 80, 80)

        // floor
        floor = SCNFloor()
        floor.reflectionFalloffEnd = 3.0

//        let floorMaterial = SCNMaterial(cubeMap: "calm")
        let floorMaterial = SCNMaterial()
        floorMaterial.ambient.contents = NSColor.blackColor()
        floorMaterial.diffuse.contents = NSImage(named: "atari_bluenoise")
        floorMaterial.specular.wrapS = .WrapModeMirror
        floorMaterial.specular.wrapT = .WrapModeMirror
        floorMaterial.diffuse.wrapS  = .WrapModeMirror
        floorMaterial.diffuse.wrapT  = .WrapModeMirror

        // Use a shader modifier to support a secondary texture
        let shaderFile = NSBundle.mainBundle().pathForResource("floor", ofType: "shader")
        let shaderSource = NSString(contentsOfFile: shaderFile, encoding: NSUTF8StringEncoding, error: nil)       
        floorMaterial.shaderModifiers = [ SCNShaderModifierEntryPointSurface : shaderSource ];
        floor.firstMaterial = floorMaterial
        floor.setImage("atari_bluenoise")
//        floor.setCubemap("city")
        floorNode = SCNNode(geometry: floor)

        // objects
        let box = SCNBox(size: 80.0)
        box.firstMaterial = SCNMaterial(cubeMap: "greywash")
        mysteryCube = SCNNode(geometry: box)
        mysteryCube.rotate(M_PI/2.0, x: 1, y: 0, z: 0)
        mysteryCube.setRotation(vector: SCNVector3Make(1, 0.5, 0), duration: 10.0)

        rootNode.addChildNode(cameraNode)
        rootNode.addChildNode(ambientLightNode)
        rootNode.addChildNode(omniLightNode)
        rootNode.addChildNode(floorNode)
        rootNode.addChildNode(mysteryCube)

        super.init(coder: coder)

        audioPlayer.addObserver(self, forKeyPath: "status", options: nil, context: nil)
        setSkybox("city")
    }

    override func awakeFromNib() {
        sceneView = self.view as SCNView
        sceneView.jitteringEnabled = true
        sceneView.backgroundColor = NSColor.grayColor()
        sceneView.scene = scene
        sceneView.delegate = self
        sceneView.pointOfView = cameraNode
        overlayScene = OverlayScene(size: sceneView.bounds.size)
        overlayScene.setImage("atari_bluenoise")
//        sceneView.overlaySKScene = overlayScene // NEED OSX 10.10

//        let animalgirlNode = SCNNode(resourceName: "animalgirl")
//        animalgirlNode.rotate(-M_PI/3.0, x: 0, y: 1, z: 0)
//        animalgirlNode.position = SCNVector3Make(0, -190, 0)
//        animalgirlNode.scale(0.1)
//        rootNode.addChildNode(animalgirlNode)

//
//        let sphere = SCNSphere(radius: 40)
//        sphereNode = SCNNode(geometry: sphere)
//        sphereNode.position = SCNVector3Make(0, 20, 0.0)
//        rootNode.addChildNode(sphereNode)

//
//        let text = SCNText(string: "☛", extrusionDepth: 4.0)
//        let textNode = SCNNode(geometry: text)
//        textNode.position = SCNVector3Make(-1, 2, 0)
//        textNode.transform = CATransform3DScale(textNode.transform, 0.1, 0.1, 0.1)
//        cubeNode.addChildNode(textNode)
    }

    // MARK: KVO
    override func observeValueForKeyPath(keyPath: String!, ofObject object: AnyObject!, change: [NSObject : AnyObject]!, context: UnsafeMutablePointer<()>) {
        if object is AVPlayer {
            if (audioPlayer.status == AVPlayerStatus.ReadyToPlay) {
                audioPlayer.prerollAtRate(1, completionHandler: { finished in
                    self.startTime = NSDate()
                    self.audioPlayer.play()
                })
            }
        }
    }

    func setSkybox(name: String) {
        scene.setSkybox(name)
//        floor.setCubemap(name)
    }

}
