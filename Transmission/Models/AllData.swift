//
//  AllData.swift
//  Transmission
//
//  Created by Adam Kaump on 2/23/21.
//

import Foundation

class AllData: ObservableObject {
    var container: TorrentsContainer? {
        didSet {
            torrents = container?.sortedAndFilteredTorrents
        }
    }
    
    var sortBy: SortBy = Storage.sortBy() {
        didSet {
            Storage.setSortBy(sortBy)
            torrents = container?.sortedAndFilteredTorrents
        }
    }
    
     var ascendingDescending: AscendingDescending = Storage.ascendingDescending() {
         didSet {
             Storage.setAscendingDescending(ascendingDescending)
             torrents = container?.sortedAndFilteredTorrents
         }
     }
    
    @Published var torrents: [Torrent]? {
        didSet {
//            print("here")
        }
    }
}
