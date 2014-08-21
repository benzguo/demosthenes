import SceneKit

extension SCNScene {
    func setSkybox(name: String) {
        self.background.contents = [
            NSImage(named: "\(name)_right"),
            NSImage(named: "\(name)_left"),
            NSImage(named: "\(name)_top"),
            NSImage(named: "\(name)_top"), // no bottom
            NSImage(named: "\(name)_back"),
            NSImage(named: "\(name)_front"),
        ]
    }
}