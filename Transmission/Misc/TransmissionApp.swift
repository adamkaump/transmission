//
//  TransmissionApp.swift
//  Transmission
//
//  Created by Adam Kaump on 2/19/21.
//

import SwiftUI

@main
struct TransmissionApp: App {
    
    @StateObject var allData = AllData()
    
    var body: some Scene {
        WindowGroup {
            TorrentsList()
                .environmentObject(allData)
        }
    }
}
