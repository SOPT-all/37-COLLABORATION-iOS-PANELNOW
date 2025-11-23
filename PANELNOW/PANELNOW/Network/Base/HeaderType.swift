//
//  HeaderType.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/24/25.
//

import Foundation

enum HeaderType {
    case auth
    case none
    
    var type: [String: String] {
        switch self {
        case .auth:
            [
                "Content-Type": "application/json",
                "product-id": "1"
            ]
        case .none:
            ["Content-Type": "application/json"]
        }
    }
}
