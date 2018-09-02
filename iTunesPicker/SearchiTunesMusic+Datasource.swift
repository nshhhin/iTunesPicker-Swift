

import UIKit
import AVFoundation

extension SearchiTunesMusicVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if let results = self.results {
            return (results.results?.count)!
        } else {
            return 0
        }
        
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(with: SearchResultCell.self,
                                                      for: indexPath)
        let result = results.results![indexPath.row]
        let strImg = result.thumbnail
        print(strImg)
        cell.titleLabel.text = result.title
        cell.artistLabel.text = result.artist
        cell.albumLabel.text = result.album
        if let url = URL(string: result.thumbnail) {
            cell.artworkUIV.af_setImage(withURL: url)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var result = results.results![indexPath.row]
        print("==================")
        print( result.previewURL )
        print("==================")
        player = AVPlayer(url: URL(string: result.previewURL)!)
        player?.play()
        
        
    }
    
}
