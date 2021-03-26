import Foundation
import Alamofire

class Network {
    
    func fetch(requestNative: RequestNative,
               onSuccess: @escaping ([String : Any]) -> Void,
               onFailure: @escaping (RequestError) -> Void) {
        
        Alamofire.request(requestNative.asURLRequest).responseString { (dataResponse) in
            if let response = dataResponse.response {
                
                let statusCode = response.statusCode
                if 200...299 ~= statusCode {
                    var responseNative: [String: Any] = [:]
                    responseNative["statusCode"] = "\(statusCode)"
                    responseNative["response"] = dataResponse.result.value ?? ""
                    onSuccess(responseNative)
                } else {
                    let error = RequestError(rawValue: statusCode) ?? .unknownError
                    onFailure(error)
                }
                
            } else {
                onFailure(.unknownError)
            }
        }
    }
    
}
