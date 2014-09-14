import SceneKit

extension SCNNode {
    convenience init(resourceName: String) {
        self.init()
        let sceneURL = NSBundle.mainBundle().URLForResource(resourceName, withExtension: "dae")
        let sceneSource = SCNSceneSource(URL: sceneURL!, options: nil)
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
        self.rotation = SCNVector4Make(CGFloat(x), CGFloat(y), CGFloat(z), CGFloat(angle))
    }

    func setRotation(vector v: SCNVector3, duration: Double, repeatCount: Float = Float.infinity) {

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

    func stopRotation() {
        self.removeAnimationForKey("rotation")
    }

    func setGeometryShader(name: String) {
        setShader(name, entryPoint: SCNShaderModifierEntryPointGeometry)
    }

    func setSurfaceShader(name: String) {
        setShader(name, entryPoint: SCNShaderModifierEntryPointSurface)
    }

    func setLightingShader(name: String) {
        setShader(name, entryPoint: SCNShaderModifierEntryPointLightingModel)
    }

    func setFragmentShader(name: String) {
        setShader(name, entryPoint: SCNShaderModifierEntryPointFragment)
    }   

    private func setShader(name: String, entryPoint: String) {
        let shader = ShaderManager.shaderNamed(name)
        let maybeModifiers: NSDictionary? = self.geometry!.firstMaterial!.shaderModifiers
        var shaderModifiers = NSMutableDictionary()
        if let modifiers = maybeModifiers {
            shaderModifiers = modifiers.mutableCopy() as NSMutableDictionary
        }
        shaderModifiers[entryPoint] = shader
        self.geometry!.firstMaterial!.shaderModifiers = shaderModifiers
    }
}
