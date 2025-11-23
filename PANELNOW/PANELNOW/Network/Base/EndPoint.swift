//
//  EndPoint.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/24/25.
//

import Foundation

enum EndPoint {
    case fetchHome // 뷰1
    case fetchExchange // 뷰2
    case fetchProductDetail(Int) // 뷰3
    
    var url: String {
        switch self {
        case .fetchHome:
            return "/api/v1/users"
        case .fetchExchange:
            return "/api/v1/product"
        case .fetchProductDetail(let productId):
            return "/api/v1/products/\(productId)"
        }
    }
    
    var header: [String: String] {
        switch self {
        case .fetchHome, .fetchExchange:
            HeaderType.none.type
        case .fetchProductDetail:
            HeaderType.auth.type
        }
    }
}
