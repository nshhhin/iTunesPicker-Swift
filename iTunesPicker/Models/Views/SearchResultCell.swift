
import UIKit

final class SearchResultCell: UICollectionViewCell {
    
    @IBOutlet weak var artworkUIV: UIImageView!
    
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
