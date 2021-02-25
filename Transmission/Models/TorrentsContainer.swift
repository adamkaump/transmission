//
//  TorrentsContainer.swift
//  Transmission
//
//  Created by Adam Kaump on 2/22/21.
//

import SwiftUI

class TorrentsContainer: Codable, ObservableObject {
    
    var arguments: [String: [Torrent]]
    
    private enum CodingKeys: String, CodingKey {
        case arguments
    }
    
    var sortedAndFilteredTorrents: [Torrent]? {
        let sortOption = Storage.sortBy()
        return arguments["torrents"]?.sorted(by: sortOption.sortClosure)
    }
}
