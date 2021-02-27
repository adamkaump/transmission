//
//  AscendingDescending.swift
//  Transmission
//
//  Created by Adam Kaump on 2/25/21.
//

import Foundation

enum AscendingDescending: String {
    case ascending = "Ascending"
    case descending = "Descending"
    
    static func allValues() -> [AscendingDescending] {
        return [.ascending, descending]
    }
    
    static func ascendingDescendingFromRawValue(_ rawValue: String) -> AscendingDescending? {
        
        if rawValue == ascending.rawValue {
            return ascending
        } else if rawValue == descending.rawValue {
            return descending
        }
        
        return nil
    }
}
