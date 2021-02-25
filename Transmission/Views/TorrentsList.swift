//
//  TorrentsList.swift
//  Transmission
//
//  Created by Adam Kaump on 2/20/21.
//

import SwiftUI

struct TorrentsList: View {
    
    @EnvironmentObject private var allData: AllData
    @State private var showingSettings = false
    @State private var showingSortFilter = false
    
    var body: some View {
        NavigationView {
            List {
                if let torrents = allData.torrents {
                    ForEach(torrents) { torrent in
                        TorrentView(torrent: torrent)
                    }
                }
            }
            .navigationTitle("Transmission")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {showingSettings.toggle()}, label: {
                        Image(systemName: "gear")
                    })
                    .sheet(isPresented: $showingSettings) {
                        Settings()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                            showingSortFilter.toggle()
                    }, label: {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    })
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: loadData)
        .sheet(isPresented: self.$showingSortFilter) {
            SortFilter()
        }
    }
}

struct TorrentView: View {
    var torrent: Torrent

    var body: some View {
        VStack(alignment: .leading) {
            Text(torrent.name)
                .fontWeight(.medium)
            
            Spacer(minLength: 10)
            
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text(torrent.percentFormatted)
                    Text(torrent.sizeFormatted)
                    Text(torrent.uploadRatioFormatted)
                }
                .font(.caption)
            }
        }
    }
}

extension TorrentsList {
    func loadData() {
        Api.allTorrents { container in
            self.allData.container = container
        }
    }
}


struct TorrentsList_Previews: PreviewProvider {
    static var previews: some View {
        TorrentsList().environmentObject(AllData())
    }
}
