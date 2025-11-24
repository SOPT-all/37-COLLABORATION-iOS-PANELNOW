//
//  HeaderType.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/24/25.
//

import Foundation

enum HeaderType {
    case auth(productId: Int)
    case none
    
    var type: [String: String] {
        switch self {
        case .auth(let productId):
            [
                "Content-Type": "application/json",
                "product-id": "\(productId)"
            ]
        case .none:
            ["Content-Type": "application/json"]
        }
    }
}
