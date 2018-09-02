
import Foundation
import PromiseKit
import Alamofire
import ObjectMapper

final class iTunesRSSModel {
    
    static let shared = iTunesRSSModel()
    
    func request() -> Promise<String> {
        let url = "https://rss.itunes.apple.com/api/v1/jp/itunes-music/top-songs/all/100/explicit.json"
        
        return Promise { seal in
            Alamofire.request(url).responseString { response in
                switch response.result {
                case .success(let data):
                    seal.fulfill(data)
                case .failure:
                    seal.reject(InternalError.loadFileFailed)
                }
            }
        }
    }
    
    func mapping(jsonStr: String) -> Promise<RSSResults> {
        return Promise { seal in
            print( jsonStr )
            guard let results = Mapper<RSSResults>().map(JSONString: jsonStr) else {
                return seal.reject(InternalError.mapFailed)
            }
            seal.fulfill(results)
        }
    }
}

struct RSSResults: Mappable {
    
    var results: [Result]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        results <- map["feed.results"]
    }
}
