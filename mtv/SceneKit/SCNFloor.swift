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
        self.firstMaterial = SCNMaterial(cubeMap: name)
    }
}