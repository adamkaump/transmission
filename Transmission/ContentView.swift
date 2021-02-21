//
//  ContentView.swift
//  Transmission
//
//  Created by Adam Kaump on 2/19/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var container: TorrentsContainer? = Bundle.main.decode(TorrentsContainer.self, from: "data.json")
    @State private var showingSettings = false
    
    var body: some View {
        NavigationView {
            List {
                if let torrents = container?.torrents {
                    ForEach(torrents) { torrent in
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
                    Button(action: {}, label: {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    })
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: loadData)
    }
}

extension ContentView {
    func loadData() {
        Api.allTorrents { container in
            self.container = container
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
