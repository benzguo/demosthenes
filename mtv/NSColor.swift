import Cocoa

extension NSColor {
    class func randomColor() -> NSColor {
        let r = CGFloat(Double(arc4random_uniform(255))/255.0)
        let g = CGFloat(Double(arc4random_uniform(255))/255.0)
        let b = CGFloat(Double(arc4random_uniform(255))/255.0)
        return NSColor(red: r, green: g, blue: b, alpha: 1)
    }
}
