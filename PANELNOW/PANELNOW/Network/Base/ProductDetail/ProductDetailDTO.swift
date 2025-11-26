//
//  ProductDetailDTO.swift
//  PANELNOW
//
//  Created by 홍준범 on 11/24/25.
//

import Foundation

typealias ProductDetailResponse = BaseResponse<ProductDetailDTO>

struct ProductDetailDTO: Codable {
    let id: Int
    let imageUrl: String
    let name: String
    let price: Int
    let phoneNumber: String
    let exchangeDay: String
    let infoSections: [InfoSectionDTO]
}

struct InfoSectionDTO: Codable {
    let label: String
    let content: String
}
