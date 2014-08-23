import SceneKit

extension SCNFloor {
    func setImage(name: String) {
        // Set a new material property with this image to the "floorMap" custom property of the floor
        let image = NSImage(named: "\(name)_top")
        let property = SCNMaterialProperty(contents: image)
        property.wrapS = .WrapModeRepeat;
        property.wrapT = .WrapModeRepeat;
        property.mipFilter = .FilterModeLinear;

        self.firstMaterial.setValue(property, forKey: "floorMap")
    }
}