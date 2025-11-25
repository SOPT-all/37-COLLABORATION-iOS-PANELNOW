//
//  ExchangeDTO.swift
//  PANELNOW
//
//  Created by 박정환 on 11/24/25.
//

import Foundation

typealias ProductListResponseDTO = BaseResponse<[ProductDTO]>

struct ProductDTO: Decodable {
    let id: Int
    let imageUrl: String
    let name: String
    let price: Int
    let day: String
}
