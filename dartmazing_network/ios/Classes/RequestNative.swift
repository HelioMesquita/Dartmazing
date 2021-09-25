struct RequestNative {
    let url: String
    let body: [String: Any]
    let headers: [String : String]
    let method: String
    
    init?(json: [String: Any]) {
        guard let url = json["url"] as? String,
            let body = json["body"] as? [String: Any],
            let headers = json["headers"] as? [String: String],
            let method = json["method"] as? String else { return nil }
        
        self.url = url
        self.body = body
        self.headers = headers
        self.method = method
    }
    
    var asURLRequest: URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method
        headers.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        if !body.isEmpty, let body = try? JSONSerialization.data(withJSONObject: body) {
            request.httpBody = body
        }
        return request
    }
    
}
