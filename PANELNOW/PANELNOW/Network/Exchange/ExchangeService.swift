//
//  ExchangeService.swift
//  PANELNOW
//
//  Created by 박정환 on 11/24/25.
//

import Foundation

final class ExchangeService {
    static let shared = ExchangeService()
    private init() {}
    
    func fetchProducts(sort: SortOption? = nil) async throws -> [ProductDTO] {
        let sortQuery = sort?.apiValue
        return try await BaseService.shared.request(endPoint: .fetchExchange(sort: sortQuery))
    }
}
