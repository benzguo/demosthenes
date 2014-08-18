import SceneKit

extension SCNNode {
    convenience init(resourceName: String) {
        self.init()
        let sceneURL = NSBundle.mainBundle().URLForResource(resourceName, withExtension: "dae")
        let sceneSource = SCNSceneSource(URL: sceneURL, options: nil)
        let identifiers = sceneSource.identifiersOfEntriesWithClass(SCNNode.self) as [String]
        for id: String in identifiers {
            let node = sceneSource.entryWithIdentifier(id, withClass: SCNNode.self) as SCNNode
            self.addChildNode(node)
        }
    }

    func scale(scale: Float) {
        let s = CGFloat(scale)
        let transform = CATransform3DMakeScale(s, s, s)
        self.transform = transform
    }

    func rotate(angle: Double, x: Float, y: Float, z: Float) {
        let rotation = CATransform3DMakeRotation(CGFloat(angle),
            CGFloat(x), CGFloat(y), CGFloat(z))
        self.transform = rotation
    }

    func addRotation(vector v: SCNVector3, duration: Double, repeatCount: Float = Float.infinity) {

        let t = CGFloat(M_PI/2.0)
        let animation = CAKeyframeAnimation(keyPath: "transform")
        let transform = self.transform
        animation.values = [
            NSValue(CATransform3D: CATransform3DRotate(transform,
                0.0 * t, v.x, v.y, v.z)),
            NSValue(CATransform3D: CATransform3DRotate(transform,
                1.0 * t, v.x, v.y, v.z)),
            NSValue(CATransform3D: CATransform3DRotate(transform,
                2 * t, v.x, v.y, v.z)),
            NSValue(CATransform3D: CATransform3DRotate(transform,
                3 * t, v.x, v.y, v.z)),
            NSValue(CATransform3D: CATransform3DRotate(transform,
                4 * t, v.x, v.y, v.z))
        ]
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = duration
        animation.repeatCount = repeatCount
        self.addAnimation(animation, forKey: "rotation")
    }

    func flash(color: NSColor, duration: Double = 0.2) {
        let material = self.geometry.materials[0] as SCNMaterial
        let maybeColor: AnyObject!  = material.diffuse.contents
        if maybeColor is NSColor {
            let originalColor = maybeColor as NSColor
            material.addColorAnimation([color, originalColor], duration: duration, repeatCount: 1, timingFunction: CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut))
        }
    }
}
