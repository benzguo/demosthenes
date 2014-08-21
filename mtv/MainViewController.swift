import Cocoa
import SceneKit
import AVFoundation
import CoreMedia

class MainViewController: NSViewController, SCNSceneRendererDelegate {

    var sceneView: SCNView!
    var sphereNode: SCNNode!
    var song: Song
    var audioPlayer: AVPlayer
    var startDate: NSDate?
    var camera: SCNCamera
    var cameraNode: SCNNode

    required init(coder: NSCoder!) {
        // audio
        song = Song()
        let path = NSBundle.mainBundle().pathForResource("Song In My Head", ofType: "aif")
        let url = NSURL(fileURLWithPath: path)
        audioPlayer = AVPlayer(URL: url)

        // camera
        camera = SCNCamera()
        cameraNode = SCNNode()
        cameraNode.camera = camera

        super.init(coder: coder)

        audioPlayer.addObserver(self, forKeyPath: "status", options: nil, context: nil)
    }

    override func awakeFromNib() {
        sceneView = self.view as SCNView
        sceneView.backgroundColor = NSColor.grayColor()
        sceneView.scene = SCNScene()
        sceneView.scene.setSkybox("hazy_lake")
        sceneView.delegate = self
        let rootNode = sceneView.scene.rootNode

        camera.xFov = 90 // increase for wide angle
        camera.yFov = 90
        cameraNode.position = SCNVector3Make(0, 30, 90)
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
        diffuseLightNode.position = SCNVector3Make(0, 80, 80)
        rootNode.addChildNode(diffuseLightNode)

        let flatShinyMaterial = SCNMaterial(cubeMap: "greywash")

        let floor = SCNFloor()
        floor.reflectionFalloffEnd = 200
        floor.materials = [flatShinyMaterial]
        let floorNode = SCNNode(geometry: floor)
        rootNode.addChildNode(floorNode)


//        let animalgirlNode = SCNNode(resourceName: "animalgirl")
//        animalgirlNode.rotate(-M_PI/3.0, x: 0, y: 1, z: 0)
//        animalgirlNode.position = SCNVector3Make(0, -190, 0)
//        animalgirlNode.scale(0.1)
//        rootNode.addChildNode(animalgirlNode)

        let cube = SCNBox(size: 80.0)
        cube.materials = [flatShinyMaterial]
        let cubeNode = SCNNode(geometry: cube)
        cubeNode.addRotation(vector: SCNVector3Make(1.0, 1.0, 1.0), duration: 5.0)
        rootNode.addChildNode(cubeNode)

        let sphere = SCNSphere(radius: 40)
        sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = SCNVector3Make(0, 20, 0.0)
        rootNode.addChildNode(sphereNode)

        let box = SCNBox(size: 80.0)
        let boxNode = SCNNode(geometry: box)
        boxNode.rotate(M_PI/2.0, x: 1, y: 0, z: 0)
        box.materials = [flatShinyMaterial]
        boxNode.addRotation(vector: SCNVector3Make(1, 0.5, 0), duration: 10.0)
        rootNode.addChildNode(boxNode)

        let text = SCNText(string: "☛", extrusionDepth: 4.0)
        let textNode = SCNNode(geometry: text)
        textNode.position = SCNVector3Make(-1, 2, 0)
        textNode.transform = CATransform3DScale(textNode.transform, 0.1, 0.1, 0.1)
        cubeNode.addChildNode(textNode)
    }

    // MARK: KVO
    override func observeValueForKeyPath(keyPath: String!, ofObject object: AnyObject!, change: [NSObject : AnyObject]!, context: UnsafeMutablePointer<()>) {
        if object is AVPlayer {
            if (audioPlayer.status == AVPlayerStatus.ReadyToPlay) {
                audioPlayer.prerollAtRate(1, completionHandler: { finished in
                    self.startDate = NSDate()
                    self.audioPlayer.play()
                })
            }
        }
    }   

    // MARK: SCNSceneRendererDelegate
    func renderer(aRenderer: SCNSceneRenderer!, willRenderScene scene: SCNScene!, atTime time: NSTimeInterval) {
        let time = NSDate().timeIntervalSinceDate(startDate)
        if isnan(time) {
            return
        }
        if time >= song.nextEvent.toRaw() {
            song.step()
            switch (song.currentEvent) {
            case .Organ:
                Organ()

            case .FirstHits1, .FirstHits2, .FirstHits3, .FirstHits4, .FirstHits5:
                break

            case .Intro1_1, .Intro1_2, .Intro1_3, .Intro1_4, .Intro2_1, .Intro2_2, .Intro2_3, .Intro2_4:
                break

            case .FirstVerse1_1, .FirstVerse1_2, .FirstVerse2_1, .FirstVerse2_2:
                break

            case .FirstChorus1_1, .FirstChorus1_2, .FirstChorus1_3, .FirstChorus1_4,
            .FirstChorus2_1, .FirstChorus2_2, .FirstChorus2_3, .FirstChorus2_4:
                break

            case .SecondHits1, .SecondHits2, .SecondHits3, .SecondHits4, .SecondHits5:
                break

            case .SecondVerse1_1, .SecondVerse1_2, .SecondVerse1_3, .SecondVerse1_4,
            .SecondVerse2_1, .SecondVerse2_2, .SecondVerse2_3, .SecondVerse2_4,
            .SecondVerse2_5, .SecondVerse2_6, .SecondVerse2_7, .SecondVerse2_8:
                break

            case .Bridge1_1, .Bridge1_2, .Bridge1_3, .Bridge1_4,
            .Bridge2_1, .Bridge2_2, .Bridge2_3, .Bridge2_4:
                break

            case .ThirdHits1, .ThirdHits2, .ThirdHits3, .ThirdHits4, .ThirdHits5:
                break

            case .Buildup1, .Buildup2, .Buildup3, .Buildup4, .Buildup5:
                break

            case .BassSolo:
                break

            case .LastChorus1_1, .LastChorus1_2, .LastChorus1_3, .LastChorus1_4,
            .LastChorus2_1, .LastChorus2_2, .LastChorus2_3, .LastChorus2_4,
            .LastChorus3_1, .LastChorus3_2, .LastChorus3_3, .LastChorus3_4,
            .LastChorus4_1, .LastChorus4_2, .LastChorus4_3, .LastChorus4_4:
                break

            case .LastHits1, .LastHits2, .LastHits3, .LastHits4, .LastHits5:
                break

            default:
                break
            }
        }
    }

    func Organ() {
        SCNTransaction.begin()
        sphereNode.flash(NSColor.greenColor())
        SCNTransaction.commit()
    }



}
