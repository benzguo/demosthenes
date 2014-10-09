import Cocoa
import SceneKit
import AVFoundation
import CoreMedia

// delay before audio playback, in seconds
let audioPlaybackDelay = 0.2



class MainViewController: NSViewController, SCNSceneRendererDelegate {

    var sceneView: SCNView!
    var overlayScene: OverlayScene!
    let scene: SCNScene
    let rootNode: SCNNode
    let cursor: Cursor
    let audioPlayer: AVAudioPlayer
    var startTime: NSDate?

    let camera: SCNCamera
    let cameraNode: SCNNode // used to move the camera relative to the global position (cameraHandle)
    let cameraHandle: SCNNode // used to control the global position in world space
    let cameraPitch: SCNNode // used to rotate the position around the x axis

    let ambientLight: SCNLight
    let ambientLightNode: SCNNode
    let omniLightANode: SCNNode
    let omniLightBNode: SCNNode
    let omniLightCNode: SCNNode

    let glitchPlane1: SCNNode
    let glitchPlane2: SCNNode
    let leftOverlay: SCNNode
    let rightOverlay: SCNNode
    let fullOverlay: SCNNode
    let agave: SCNNode
    let cubetree: SCNNode
    let taco: SCNNode
    let taco2: SCNNode

    required init?(coder: NSCoder!) {
        // scene
        scene = SCNScene()
        rootNode = scene.rootNode

        // audio
        cursor = Cursor()
        audioPlayer = AVAudioPlayer(wav: "TacoTree")

        // cameras
        camera = SCNCamera()
        camera.xFov = 100.0 // increase for wide angle
        camera.yFov = 80.0
        cameraHandle = SCNNode()
        rootNode.addChildNode(cameraHandle)
        cameraPitch = SCNNode()
        cameraHandle.addChildNode(cameraPitch)
        cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3Make(0, 1, 100)
        cameraPitch.addChildNode(cameraNode)

        // lights
        ambientLight = SCNLight()
        ambientLight.type = SCNLightTypeAmbient
        ambientLight.color = NSColor(deviceWhite: 0.1, alpha: 1.0)
        ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight

        let omniLightA = SCNLight()
        omniLightA.type = SCNLightTypeOmni
        omniLightANode = SCNNode()
        omniLightANode.light = omniLightA
        omniLightANode.position = SCNVector3Make(0, 80, 80)

        let omniLightB = SCNLight()
        omniLightB.type = SCNLightTypeOmni
        omniLightBNode = SCNNode()
        omniLightBNode.light = omniLightB
        omniLightBNode.position = SCNVector3Make(0, 0, 150)

        let omniLightC = SCNLight()
        omniLightC.type = SCNLightTypeOmni
        omniLightCNode = SCNNode()
        omniLightCNode.light = omniLightC
        omniLightCNode.position = SCNVector3Make(0, -80, 40)

        rootNode.addChildNode(cameraNode)
        rootNode.addChildNode(ambientLightNode)
        rootNode.addChildNode(omniLightANode)
        rootNode.addChildNode(omniLightBNode)
        rootNode.addChildNode(omniLightCNode)


        let leftPlane = SCNPlane(width: 200, height: 150)
        leftOverlay = SCNNode(geometry: leftPlane)
        leftOverlay.position = SCNVector3Make(-100, 0, -80)
        leftOverlay.setFragmentShader("video_frag")
        cameraNode.addChildNode(leftOverlay)

        let rightPlane = SCNPlane(width: 200, height: 150)
        rightOverlay = SCNNode(geometry: rightPlane)
        rightOverlay.position = SCNVector3Make(100, 0, -80)
        rightOverlay.setFragmentShader("video_frag")
        cameraNode.addChildNode(rightOverlay)

        let fullPlane = SCNPlane(width: 200, height: 100)
        let fullMaterial = SCNMaterial(image: "zx_areyouusingtv", transparency: 0.6)
        fullPlane.firstMaterial = fullMaterial
        fullOverlay = SCNNode(geometry: fullPlane)
        fullOverlay.position = SCNVector3Make(0, 0, -80)
        fullOverlay.setFragmentShader("video_frag")
        fullOverlay.setGeometryShader("bumps_geom2")
        cameraNode.addChildNode(fullOverlay)

        let plane = SCNPlane(width: 100.0, height: 100.0)
        plane.firstMaterial = SCNMaterial(cubeMap: "powderpeak", transparency: 1.0)
        plane.widthSegmentCount = 10
        plane.heightSegmentCount = 10
        glitchPlane1 = SCNNode(geometry: plane)
        glitchPlane1.position = SCNVector3Make(0, 0, -90)
//        glitchPlane1.setGeometryShader("bumps_geom1")
        glitchPlane1.setFragmentShader("video_frag")
        glitchPlane1.rotate(M_PI/4.0, x: 0, y: 0, z: 1)
        let hexagonal = CIFilter(name: "CIHexagonalPixellate")
        hexagonal.setDefaults()
//        hexagonal.setValue(10, forKey:"inputScale")
        glitchPlane1.filters = [hexagonal]

//        glitchPlane1.setRotation(vector: SCNVector3Make(0, 0, 1), duration: 50.0)

        let plane2 = SCNPlane(width: 100.0, height: 100.0)
        plane2.firstMaterial = SCNMaterial(cubeMap: "snowblind", transparency: 1.0)
        plane2.widthSegmentCount = 10
        plane2.heightSegmentCount = 10
        glitchPlane2 = SCNNode(geometry: plane2)
        glitchPlane2.position = SCNVector3Make(0, 0, -91)

        agave = SCNNode(resourceName: "treebranch")
        agave.scale(2.5)
//        agave.rotate(-M_PI/2.0, x: 1, y: 0, z: 0)
        agave.position = SCNVector3Make(-20.0, -25, -58)

        cubetree = SCNNode(resourceName: "cube_tree")
        cubetree.rotate(-M_PI/2.0, x: 1, y: 0, z: 0)
        cubetree.position = SCNVector3Make(-20, -20, -40)

        taco = SCNNode(resourceName: "treebranch")
        taco.scale(2.5)
        taco.position = SCNVector3Make(-20.0, -25, -58)

        taco2 = SCNNode(resourceName: "treebranch")
        taco2.rotate(-M_PI/3.0, x: 1, y: 0, z: 0)
        taco2.position = SCNVector3Make(-13, -15, -40)

        super.init(coder: coder)

    }

    override func awakeFromNib() {
        sceneView = self.view as SCNView
        sceneView.jitteringEnabled = true
        sceneView.backgroundColor = NSColor.grayColor()
        sceneView.scene = scene
        sceneView.delegate = self
        sceneView.pointOfView = cameraNode
        sceneView.playing = true
        sceneView.loops = true

        let colorControls = CIFilter(name: "CIColorControls")
        colorControls.setDefaults()
        colorControls.setValue(3.0, forKey: "inputSaturation")
        let bloomFilter = CIFilter(name: "CIBloom")
        bloomFilter.setDefaults()

        agave.filters = [colorControls, bloomFilter]

        scene.setSkybox("purplenebula")



        start()




        cameraNode.setRotation(vector: SCNVector3Make(0, 0, -1), duration: 100.0)


//        saguaro.setRotation(vector: SCNVector3Make(1, 0, -1), duration: 100.0)

// WARN: TRY THIS ON OSX 10.10
//        overlayScene = OverlayScene(size: sceneView.bounds.size)
//        overlayScene.setImage("atari_bluenoise")
//        sceneView.overlaySKScene = overlayScene // NEED OSX 10.10


    }

    func start() {
        audioPlayer.currentTime = currentTime
        audioPlayer.prepareToPlay()
        startTime = NSDate()
        audioPlayer.playAtTime(audioPlayer.deviceCurrentTime + audioPlaybackDelay)
    }

    func nodeForKey(key: UnsafePointer<()>) -> SCNNode {
        let node : SCNNode! = objc_getAssociatedObject(self, key) as SCNNode!
        return node
    }

    func saveNode(node: SCNNode, withKey key: UnsafePointer<()>) {
        objc_setAssociatedObject(self, key, node, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
    }

}
