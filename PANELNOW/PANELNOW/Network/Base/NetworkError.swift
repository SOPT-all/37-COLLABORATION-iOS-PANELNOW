//
//  NetworkError.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/24/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case responseDecodingError
    case noData
    case unknownError
    case internalServerError
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "잘못된 URL"
        case .responseDecodingError:
            return "디코딩 에러"
        case .noData:
            return "데이터 없음"
        case .unknownError:
            return "알 수 없는 에러"
        case .internalServerError:
            return "서버 에러"
        }
    }
}
