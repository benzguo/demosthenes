import Cocoa
import SceneKit
import AVFoundation
import CoreMedia

class MainViewController: NSViewController, SCNSceneRendererDelegate {

    var sceneView: SCNView!
    var scene: SCNScene!
    var rootNode: SCNNode!
    let cursor: Cursor
    let audioPlayer: AVPlayer
    var startTime: NSDate?
    let camera: SCNCamera
    let cameraNode: SCNNode
    let ambientLight: SCNLight
    let ambientLightNode: SCNNode
    let diffuseLight: SCNLight
    let diffuseLightNode: SCNNode
    let floor: SCNFloor
    let floorNode: SCNNode

    let mysteryCube: SCNNode
    var sphereNode: SCNNode!

    required init(coder: NSCoder!) {
        // audio
        cursor = Cursor()
        let path = NSBundle.mainBundle().pathForResource("Song In My Head", ofType: "aif")
        let url = NSURL(fileURLWithPath: path)
        audioPlayer = AVPlayer(URL: url)

        // camera
        camera = SCNCamera()
        cameraNode = SCNNode()
        cameraNode.camera = camera
        camera.xFov = 130 // increase for wide angle
        camera.yFov = 130
        cameraNode.position = SCNVector3Make(0, 30, 90)

        // lights
        ambientLight = SCNLight()
        ambientLight.type = SCNLightTypeAmbient
        ambientLight.color = NSColor(deviceWhite: 0.1, alpha: 1.0)
        ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight

        diffuseLight = SCNLight()
        diffuseLight.type = SCNLightTypeOmni
        diffuseLightNode = SCNNode()
        diffuseLightNode.light = diffuseLight
        diffuseLightNode.position = SCNVector3Make(0, 80, 80)

        // floor
        floor = SCNFloor()
        floor.reflectionFalloffEnd = 200
        floor.materials = [SCNMaterial(cubeMap: "calm")]
        floorNode = SCNNode(geometry: floor)

        // objects
        let box = SCNBox(size: 80.0)
        box.materials = [SCNMaterial(cubeMap: "greywash")]
        mysteryCube = SCNNode(geometry: box)
        mysteryCube.rotate(M_PI/2.0, x: 1, y: 0, z: 0)
        mysteryCube.setRotation(vector: SCNVector3Make(1, 0.5, 0), duration: 10.0)


        super.init(coder: coder)

        audioPlayer.addObserver(self, forKeyPath: "status", options: nil, context: nil)
    }

    override func awakeFromNib() {
        sceneView = self.view as SCNView
        sceneView.backgroundColor = NSColor.grayColor()
        scene = SCNScene()
        scene.setSkybox("city")
        sceneView.scene = scene
        sceneView.delegate = self
        rootNode = sceneView.scene.rootNode
        rootNode.addChildNode(cameraNode)
        rootNode.addChildNode(ambientLightNode)
        rootNode.addChildNode(diffuseLightNode)
        rootNode.addChildNode(floorNode)

        // add objects
        rootNode.addChildNode(mysteryCube)

//        let animalgirlNode = SCNNode(resourceName: "animalgirl")
//        animalgirlNode.rotate(-M_PI/3.0, x: 0, y: 1, z: 0)
//        animalgirlNode.position = SCNVector3Make(0, -190, 0)
//        animalgirlNode.scale(0.1)
//        rootNode.addChildNode(animalgirlNode)

//        let cube = SCNBox(size: 80.0)
//        cube.materials = [flatShinyMaterial]
//        let cubeNode = SCNNode(geometry: cube)
//        cubeNode.addRotation(vector: SCNVector3Make(1.0, 1.0, 1.0), duration: 5.0)
//        rootNode.addChildNode(cubeNode)
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

}
