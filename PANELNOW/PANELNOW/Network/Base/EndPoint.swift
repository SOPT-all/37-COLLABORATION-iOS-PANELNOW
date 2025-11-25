//
//  EndPoint.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/24/25.
//

import Foundation

enum EndPoint {
    case fetchHome // 뷰1
    case fetchExchange(sort: String? = nil) // 뷰2
    case fetchProductDetail(Int) // 뷰3
    case exchangeProduct(Int)
    
    var url: String {
        switch self {
        case .fetchHome:
            return "/api/v1/users"
        case .fetchExchange(let sort):
            if let sort, !sort.isEmpty {
                return "/api/v1/products?sort=\(sort)"
            } else {
                return "/api/v1/products"
            }
        case .fetchProductDetail(let productId):
            return "/api/v1/products/\(productId)"
        case .exchangeProduct(let productId):
            return "/api/v1/products/\(productId)/purchase"
        }
    }
    
    var header: [String: String] {
        switch self {
        case .fetchHome, .fetchExchange:
            return HeaderType.none.type
        case .fetchProductDetail(let productId):
            return HeaderType.auth(productId: productId).type
        case .exchangeProduct(let productId):
            return HeaderType.auth(productId: productId).type
        }
    }
}
