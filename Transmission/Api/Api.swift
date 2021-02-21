//
//  Api.swift
//  Transmission
//
//  Created by Adam Kaump on 2/20/21.
//

import Foundation

struct Api {
    static func allTorrents(completion: @escaping (TorrentsContainer?) -> Void) {
        
        let urlString = "\(rootUrl)/transmission/rpc"
        self.req(urlString: urlString, method: "POST", body: standardBody) { data, response, error in
            if let data = data, let container = try? JSONDecoder().decode(TorrentsContainer.self, from: data) {
                DispatchQueue.main.async {
                    completion(container)
                }
            }
            completion(nil)
        }
    }
    
    static func sessionId(completion: @escaping (String?) -> Void) {
        let url = URL(string: "\(rootUrl)/transmission/rpc")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            let sessionId = (response as? HTTPURLResponse)?.value(forHTTPHeaderField: "X-Transmission-Session-Id")
            completion(sessionId)
        }.resume()
    }
    
    static func req(urlString: String, method: String, body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body
        
        print(method + " " + urlString)
        
        Api.sessionId { sessionId in
            
            guard let sessionId = sessionId else {
                print("unable to get session id")
                completion(nil, nil, NSError())
                return
            }
            
            request.addValue(sessionId, forHTTPHeaderField: "X-Transmission-Session-Id")
            URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let code = (response as? HTTPURLResponse)?.statusCode {
                    print(code)
                }
                
                completion(data, response, error)
            }.resume()
        }
    }
}

extension Api {
    
    static var rootUrl: String {
        let ip = UserDefaults.standard.string(forKey: "ip") ?? ""
        let port = UserDefaults.standard.string(forKey: "port") ?? ""
        return "http://" + ip + ":" + port
    }
    
    static var standardBody: Data? {
        var body = [String: Any]()
        body["method"] = "torrent-get"
        
        let fields = ["fields": ["id", "name", "percentDone", "totalSize", "rateDownload", "rateUpload", "uploadRatio"]]
        body["arguments"] = fields
        
        do {
            let data = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            return data
        } catch {
            return nil
        }
    }
}
