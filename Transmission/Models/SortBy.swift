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
    
    static func allSortOptions() -> [SortBy] {
        return [.name, .size, .ratio]
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
            switch self {
            case .name:
                return a.name.uppercased() < b.name.uppercased()
            case .size:
                return a.totalSize > b.totalSize
            case .ratio:
                return a.uploadRatio > b.uploadRatio
            }
        }
    }
}
