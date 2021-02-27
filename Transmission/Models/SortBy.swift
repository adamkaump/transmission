//
//  SortBy.swift
//  Transmission
//
//  Created by Adam Kaump on 2/22/21.
//

import Foundation

enum SortBy: String {
    case name = "Name"
    case size = "Size"
    case ratio = "Ratio"
    case dateAdded = "Date Added"
    case uploaded = "Uploaded"
    
    static func allSortOptions() -> [SortBy] {
        return [.name, .size, .ratio, .dateAdded, .uploaded]
    }
    
    static func sortByOptionFromRawValue(_ rawValue: String) -> SortBy? {
        
        for option in SortBy.allSortOptions() {
            if option.rawValue == rawValue {
                return option
            }
        }
        
        return nil
    }
    
    var sortClosure: (_ a: Torrent, _ b: Torrent) -> Bool {
        
        return { (a: Torrent, b: Torrent) -> Bool in
            
            var c = a, d = b
            if Storage.ascendingDescending() == .descending {
                d = a
                c = b
            }
            
            switch self {
            case .name:
                return c.name.uppercased() < d.name.uppercased()
            case .size:
                return c.totalSize < d.totalSize
            case .ratio:
                return c.uploadRatio < d.uploadRatio
            case .dateAdded:
                return c.addedDate < d.addedDate
            case .uploaded:
                return c.uploadedEver < d.uploadedEver
            }
        }
    }
}
