//
//  Storage.swift
//  Transmission
//
//  Created by Adam Kaump on 2/22/21.
//

import SwiftUI

class Storage {
    
    static let sortByKey = "sortBy"
    
//    var sortBy: SortBy {
//        get { return Storage.sortBy() }
//        set {
//
//
//        }
//        didSet {
//            objectWillChange.send()
//        }
//    }
  
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
}
