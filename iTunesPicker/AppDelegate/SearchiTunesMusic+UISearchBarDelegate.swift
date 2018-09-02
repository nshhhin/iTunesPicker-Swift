
import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import PromiseKit

extension SearchiTunesMusicVC: UISearchBarDelegate {
    
    // 検索ボタン押下時の呼び出しメソッド
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        
        firstly {
            iTunesAPIModel.shared.request(keyword: searchBar.text!)
        }.then { data -> Promise<Results> in
            return iTunesAPIModel.shared.mapping(jsonStr: data)
        }.done { results in
            print("done")
            print(results)
            self.results = results
            self.collectionView.reloadData()
        }.catch { error in
            print(error)
        }
    }
    
    
}
