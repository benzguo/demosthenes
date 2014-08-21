import SceneKit

extension SCNMaterial {
    convenience init(cubeMap name: String) {
        self.init()
        let cubeMap = [
            NSImage(named: "\(name)_right"),
            NSImage(named: "\(name)_left"),
            NSImage(named: "\(name)_top"),
            NSImage(named: "\(name)_top"), // no bottom
            NSImage(named: "\(name)_back"),
            NSImage(named: "\(name)_front"),
        ]
        self.reflective.contents = cubeMap
        self.diffuse.contents = NSColor.blackColor()
        self.specular.contents = NSColor.whiteColor()
        self.shininess = 100
    }

    func addColorAnimation(colors: [NSColor],
        duration: Double,
        repeatCount: Float = 1.0,
        timingFunction: CAMediaTimingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionLinear)) {

        let animation = CAKeyframeAnimation(keyPath: "color")
        animation.values = colors
        animation.timingFunction = timingFunction
        animation.repeatCount = repeatCount
        animation.duration = duration
        self.addAnimation(animation, forKey: "color")
    }
}