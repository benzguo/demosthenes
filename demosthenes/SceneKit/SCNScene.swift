import SceneKit

extension SCNScene {
    func setSkybox(name: String) {
        let right = name + "_right"
        let left =  ""
        let top =  ""
        let front = ""
        let back = ""
//        let cubeMap: NSArray = [
//            NSImage(named: right),
//            NSImage(named: left),
//            NSImage(named: top),
//            NSImage(named: top), // no bottom
//            NSImage(named: front),
//            NSImage(named: back)
//        ]
        let cubeMap = NSImage(named: right)
        self.background.contents = cubeMap
    }
}