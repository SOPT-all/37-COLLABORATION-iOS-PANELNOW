//
//  HomeResponse.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/24/25.
//

import Foundation

struct PointData: Decodable {
    let currentPoint: Int
    let usedPoint: Int
}

typealias HomeResponse = BaseResponse<PointData>
