//
//  ProductDetailService.swift
//  PANELNOW
//
//  Created by 홍준범 on 11/24/25.
//

import Foundation

final class ProductDetailService {
    static let shared = ProductDetailService()
   
    private init() { }
    
    func fetchProductDetail(productId: Int) async throws -> ProductDetailDTO {
        return try await BaseService.shared.request(endPoint: .fetchProductDetail(productId))
    }
    
    func exchangeProduct(productId: Int) async throws -> BaseResponse<EmptyResponse> {
        return try await BaseService.shared.requestWithoutData(endPoint: .exchangeProduct(productId))
       }
}
