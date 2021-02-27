//
//  Storage.swift
//  Transmission
//
//  Created by Adam Kaump on 2/22/21.
//

import SwiftUI

class Storage {
    
    static let sortByKey = "sortBy"
    static let ascendingDescendingKey = "ascendingDescending"

    static func setSortBy(_ sortBy: SortBy) {
        UserDefaults.standard.setValue(sortBy.rawValue, forKey: Storage.sortByKey)
    }
    
    static func sortBy() -> SortBy {
    
        guard let key = UserDefaults.standard.string(forKey: Storage.sortByKey),
              let sortBy = SortBy.sortByOptionFromRawValue(key) else {
            return SortBy.allSortOptions().first!
        }
        
        return sortBy
    }
    
    static func setAscendingDescending(_ ascendingDescending: AscendingDescending) {
        UserDefaults.standard.setValue(ascendingDescending.rawValue, forKey: Storage.ascendingDescendingKey)
    }
    
    static func ascendingDescending() -> AscendingDescending {
        guard let key = UserDefaults.standard.string(forKey: Storage.ascendingDescendingKey), let ascendingDescending = AscendingDescending.ascendingDescendingFromRawValue(key) else {
            return AscendingDescending.ascending
        }
        
        return ascendingDescending
    }
}
