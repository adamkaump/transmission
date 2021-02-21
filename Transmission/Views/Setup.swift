//
//  Setup.swift
//  Transmission
//
//  Created by Adam Kaump on 2/20/21.
//

import SwiftUI

struct Setup: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var ip = UserDefaults.standard.string(forKey: "ip") ?? ""
    @State private var port = UserDefaults.standard.string(forKey: "port") ?? ""
    
    var body: some View {
        Form {
            Section(header: Text("IP & Port"), footer: Text("Enter the data for your Transmission server.")) {
                TextField("IP", text: $ip)
                    .onChange(of: ip, perform: { value in
                        UserDefaults.standard.setValue(value, forKey: "ip")
                    })
                    .keyboardType(.decimalPad)
                TextField("Port", text: $port)
                    .onChange(of: port, perform: { value in
                        UserDefaults.standard.setValue(value, forKey: "port")
                    })
                    .keyboardType(.numberPad)
            }
            
            Button("Save changes") {
                self.mode.wrappedValue.dismiss()
            }
        }
        .onDisappear(perform: {
            UserDefaults.standard.synchronize()
        })
    }
}

struct Setup_Previews: PreviewProvider {
    static var previews: some View {
        Setup()
    }
}
