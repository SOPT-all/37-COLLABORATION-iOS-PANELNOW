//
//  HomeService.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/24/25.
//

import Foundation

final class HomeService {
    static let shared = HomeService()
    private init() {}
    
    func fetchHome() async throws -> PointData {
        return try await BaseService.shared.request(endPoint: .fetchHome)
    }
}
