
import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import PromiseKit

extension SearchiTunesMusicVC: UISearchBarDelegate {
    
    // 検索ボタン押下時の呼び出しメソッド
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBox.endEditing(true)
        
        firstly {
            iTunesAPIModel.shared.request(apiKey: apiKey, keyword: searchBoxQuery)
            }.then { data -> Promise<Results> in
                return YoutubeAPIJSON.shared.mapping(jsonStr: data)
            }.done { results in
                print("done")
                print(results)
                self.results = results
                self.searchResultCollectionV.reloadData()
            }.catch { error in
                print(error)
        }
    }
    
    // テキスト変更時の呼び出しメソッド
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBoxQuery = searchText
    }
    
}
