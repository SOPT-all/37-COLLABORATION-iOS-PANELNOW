//
//  Int+.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/24/25.
//

import Foundation

extension Int {
    var formattedWithComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
