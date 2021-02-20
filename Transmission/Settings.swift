//
//  Settings.swift
//  Transmission
//
//  Created by Adam Kaump on 2/20/21.
//

import SwiftUI

struct Settings: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: Text("Statistics"),
                    label: {
                        Text("Statistics")
                    })
                
                NavigationLink(
                    destination: Text("Todo"),
                    label: {
                        Text("Add Torrent")
                    })

                Section {
                    NavigationLink(
                        destination: Text("Setup"),
                        label: {
                            Text("Setup")
                        })
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                        Text("Done")
                    })
                }
            }
        }
    }
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
