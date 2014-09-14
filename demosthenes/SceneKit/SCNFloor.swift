import SceneKit

extension SCNFloor {
    func setImage(name: String) {
        let material = SCNMaterial()
        material.ambient.contents = NSColor.blackColor()
        material.diffuse.contents = NSImage(named: name)
        material.specular.wrapS = .WrapModeMirror
        material.specular.wrapT = .WrapModeMirror
        material.diffuse.wrapS  = .WrapModeMirror
        material.diffuse.wrapT  = .WrapModeMirror
        self.firstMaterial = material
    }

    func setCubemap(name: String) {
        let shaderModifiers = self.firstMaterial!.shaderModifiers
        firstMaterial = SCNMaterial(cubeMap: name)
        firstMaterial!.shaderModifiers = shaderModifiers
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
        let maybeModifiers: NSDictionary? = self.firstMaterial!.shaderModifiers
        var shaderModifiers = NSMutableDictionary()
        if let modifiers = maybeModifiers {
            shaderModifiers = modifiers.mutableCopy() as NSMutableDictionary
        }
        shaderModifiers[entryPoint] = shader
        firstMaterial!.shaderModifiers = shaderModifiers
    }
}