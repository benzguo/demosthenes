import SceneKit

extension SCNBox {
    convenience init(size: Float) {
        self.init()
        let s = CGFloat(size)
        self.width = s
        self.height = s
        self.length = s
        self.chamferRadius = 0.0
    }
}
