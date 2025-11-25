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
    let imageURL: String
    let name: String
    let price: Int
    let phoneNumber: String
    let exchangeDay: String
    let infoSections: [InfoSectionDTO]
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case name
        case price
        case phoneNumber
        case exchangeDay
        case infoSections
    }
}

struct InfoSectionDTO: Codable {
    let label: String
    let content: String
}
