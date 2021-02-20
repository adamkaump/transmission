//
//  Torrent.swift
//  Transmission
//
//  Created by Adam Kaump on 2/19/21.
//

import Foundation

struct Torrent: Codable, Identifiable {
    let id: Int
    let name: String
    let percentDone: Int
    let rateUpload: Int
    let rateDownload: Int
    let totalSize: Double
    let uploadRatio: Double
    
    var percentFormatted: String {
        return "\(self.percentDone * 100)%"
    }
    
    var uploadRatioFormatted: String {
        let raw = self.uploadRatio
        let rounded = Double(round(100*raw)/100)
        return "Ratio: \(rounded)%"
    }
    
    var sizeFormatted: String {
        let gb = totalSize * 0.000000001
        let rounded = Double(round(100*gb)/100)
        return "\(rounded) GB"
    }
}

struct TorrentsContainer: Codable {
    let arguments: [String: [Torrent]]
    var torrents: [Torrent]? {
        return arguments["torrents"]?.sorted(by: { (a, b) -> Bool in
            a.name.uppercased() < b.name.uppercased()
        })
    }
}
