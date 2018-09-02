
import UIKit
import AVFoundation
import PromiseKit

class SearchiTunesMusicVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var player: AVPlayer!
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(cellType: SearchResultCell.self)
            collectionView.backgroundColor = UIColor.clear
        }
    }
    var results: Results!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

