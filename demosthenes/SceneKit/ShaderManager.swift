import SceneKit

public class ShaderManager {

    class func shaderNamed(name: String) -> NSString {
        let shaderPath = NSBundle.mainBundle().pathForResource(name, ofType: "shader")
        let shader = NSString(contentsOfFile: shaderPath!, encoding: NSUTF8StringEncoding, error: nil)
        return shader
    }

    class func toonShader() -> NSString {
        return ShaderManager.shaderNamed("toon")
    }
}
