//
//  Double+Extension.swift
//  Transmission
//
//  Created by Adam Kaump on 2/25/21.
//

import Foundation

extension Double {
    var gbString: String {
        let gb = self * 0.000000001
        let mult = gb * 100
        let rounded = mult.rounded()
        let divide = rounded/100
//        let rounded = Double(round(100*gb)/100)
        return "\(divide) GB"
    }
}
