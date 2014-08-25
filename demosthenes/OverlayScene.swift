import SpriteKit

public class OverlayScene: SKScene {

    public var imageNode: SKSpriteNode

    required public init(coder: NSCoder!) {
        fatalError("NSCoding not supported")
    }

    override init(size: CGSize) {
        imageNode = SKSpriteNode()

        super.init(size: size)

        self.anchorPoint = CGPointMake(0.5, 0.5);
        // automatically resize to fill the viewport
        self.scaleMode = .ResizeFill;
    }

    public func setImage(name: String) {
        imageNode = SKSpriteNode(imageNamed: name)
    }
}
