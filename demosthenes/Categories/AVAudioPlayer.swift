import AVFoundation

extension AVAudioPlayer {
    convenience init(aif: String) {
        let path = NSBundle.mainBundle().pathForResource(aif, ofType: "aif")
        let url = NSURL(fileURLWithPath: path)
        self.init(contentsOfURL: url, error: nil)
    }
}
