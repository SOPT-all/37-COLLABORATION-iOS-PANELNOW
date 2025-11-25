//
//  ExchangeService.swift
//  PANELNOW
//
//  Created by 박정환 on 11/24/25.
//

import Foundation

protocol ExchangeServiceProtocol {
    func fetchProducts(sort: SortOption?) async throws -> [ProductDTO]
}

final class ExchangeService: ExchangeServiceProtocol {

    static let shared = ExchangeService()
    private init() { }

    func fetchProducts(sort: SortOption? = nil) async throws -> [ProductDTO] {
        let sortQuery = sort?.apiValue
        
        let products: [ProductDTO] = try await BaseService.shared.request(
            endPoint: .fetchExchange(sort: sortQuery)
        )
        return products
    }
}
