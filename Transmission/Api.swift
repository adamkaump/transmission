//
//  Api.swift
//  Transmission
//
//  Created by Adam Kaump on 2/20/21.
//

import Foundation

struct Api {
    static func allTorrents(completion: @escaping (TorrentsContainer?) -> Void) {
        let urlString = "http://192.168.1.13:9091/transmission/rpc"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("LtNdAFymX71Fok7F9W8CHt0ujndWDeNRr5j5cuOTXwNxhJVh", forHTTPHeaderField: "X-Transmission-Session-Id")
        request.httpBody = body
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let container = try? JSONDecoder().decode(TorrentsContainer.self, from: data) {
                DispatchQueue.main.async {
                    completion(container)
                }
            }
            completion(nil)
        }.resume()
    }
    
    static var body: Data? {
        var body = [String: Any]()
        body["method"] = "torrent-get"
        
        let fields = ["fields": ["id", "name", "percentDone", "totalSize", "rateDownload", "rateUpload", "uploadRatio"]]
        body["arguments"] = fields
        
        /*{
         "arguments": {
           "fields": [ "id", "name", "percentDone", "totalSize", "rateDownload", "rateUpload", "uploadRatio" ]
         },
         "method": "torrent-get"
       }*/
        
        do {
            let data = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            return data
        } catch {
            return nil
        }
    }
}
