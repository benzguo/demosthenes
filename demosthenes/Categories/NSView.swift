import Cocoa

extension NSView {
    var backgroundColor: NSColor {
        get {
            let colorRef = self.layer?.backgroundColor
            return NSColor(CGColor: colorRef!)
        }
        set(backgroundColor) {
            self.wantsLayer = true
            self.layer!.backgroundColor = backgroundColor.CGColor
        }
    }
}
