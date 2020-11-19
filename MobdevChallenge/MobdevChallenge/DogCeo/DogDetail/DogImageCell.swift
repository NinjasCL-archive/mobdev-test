import UIKit
import API

public final class DogImageCell : UITableViewCell {
    public var dog: Dog?
    @IBOutlet var photo: UIImageView!
    
    public func fetchImage() {
        self.dog?.fetchImage(success: { result in
            self.photo.image = UIImage(data: result)
            self.setNeedsDisplay()
        }, error: nil)
    }
}
