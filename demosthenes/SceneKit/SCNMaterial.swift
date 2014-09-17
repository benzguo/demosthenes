import SceneKit

extension SCNMaterial {
    convenience init(cubeMap name: String, transparency: Double = 1.0) {
        self.init()
        let cubeMap = [
            NSImage(named: "\(name)_right"),
            NSImage(named: "\(name)_left"),
            NSImage(named: "\(name)_top"),
            NSImage(named: "\(name)_top"), // no bottom
            NSImage(named: "\(name)_front"),
            NSImage(named: "\(name)_back"),
        ]
        self.reflective.contents = cubeMap
        self.diffuse.contents = NSColor.blackColor()
        self.specular.contents = NSColor.whiteColor()
        self.shininess = 100
        self.transparency = CGFloat(transparency)
    }

    convenience init(image name: String, transparency: Double = 1.0) {
        self.init()
        self.ambient.contents = NSColor.blackColor()
        self.diffuse.contents = NSImage(named: name)
//        self.diffuse.contentsTransform = CATransform3DScale(CATransform3DMakeRotation(CGFloat(M_PI / 4.0), 0, 0, 1), 2.0, 2.0, 1.0);
        self.specular.wrapS = .WrapModeRepeat
        self.specular.wrapT = .WrapModeRepeat
        self.diffuse.wrapS  = .WrapModeRepeat
        self.diffuse.wrapT  = .WrapModeRepeat
        self.shininess = 0
        self.transparency = CGFloat(transparency)
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