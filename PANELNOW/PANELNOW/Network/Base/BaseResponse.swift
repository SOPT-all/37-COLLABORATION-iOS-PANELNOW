//
//  BaseResponse.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/24/25.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let status: Int
    let code: String?
    let message: String
    let data: T?
}
