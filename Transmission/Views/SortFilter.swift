//
//  SortFilter.swift
//  Transmission
//
//  Created by Adam Kaump on 2/20/21.
//

import SwiftUI

struct SortFilter: View {
    @EnvironmentObject private var allData: AllData
    
    @State private var status = "All"
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Status")) {
                    Text("All")
                    Text("Active")
                    Text("Downloading")
                    Text("Seeding")
                    Text("Paused")
                    Text("Finished")
                }
                
                Section(header: Text("Sort By")) {
                    ForEach(SortBy.allSortOptions(), id: \.self) { option in
                        Button(action: {
                            allData.sortBy = option
                        }) {
                            HStack {
                                Text(option.rawValue)
                                    .foregroundColor(Color.primary)
                                Spacer()
                                if allData.sortBy == option {
                                    Image(systemName: "checkmark")
                                }
                            }

                        }
                    }
                }
                
                Section(header: Text("Sort")) {
                    Text("Ascending")
                    Text("Descending")
                }
                
                Section {
                    Button("Save") {
                        self.mode.wrappedValue.dismiss()
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Sort/Filter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SortFilter_Previews: PreviewProvider {
    static var previews: some View {
        SortFilter()
    }
}
