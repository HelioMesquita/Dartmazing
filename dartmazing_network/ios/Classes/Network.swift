import Foundation
import Alamofire

class Network {
    
    func fetch(requestNative: RequestNative, onFinished: @escaping ([String : Any]) -> Void) {
        Alamofire.request(requestNative.asURLRequest).responseString { (response) in
            var responseNative: [String: Any] = [:]
            
            if let status = response.response?.statusCode {
                responseNative["statusCode"] = "\(status)"
            }
            
            if let jsonData = response.result.value {
                responseNative["response"] = jsonData
            }
            
            onFinished(responseNative)
        }
    }
    
}
