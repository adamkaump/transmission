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
    let addedDate: Int
    let uploadedEver: Double
    
    var percentFormatted: String {
        return "\(self.percentDone * 100)%"
    }
    
    var uploadRatioFormatted: String {
        let raw = self.uploadRatio
        let rounded = Double(round(100*raw)/100)
        return "Ratio: \(rounded)"
    }
    
    var sizeFormatted: String {
        return "Size: \(totalSize.gbString)"
    }
    
    var uploadedEverFormatted: String {
        return "Uploaded: \(uploadedEver.gbString)"
    }
    
    var addedDateFormatted: String {
        let interval = TimeInterval(addedDate)
        let date = Date(timeIntervalSince1970: interval)
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return "Added: \(formatter.string(from: date))"
    }
}

