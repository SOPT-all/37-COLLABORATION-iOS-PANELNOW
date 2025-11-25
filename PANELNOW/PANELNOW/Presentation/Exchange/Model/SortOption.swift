//
//  SortOption.swift
//  PANELNOW
//
//  Created by 박정환 on 11/21/25.
//

enum SortOption {
    case popular
    case price
}

extension SortOption {
    var apiValue: String? {
        switch self {
        case .popular:
            return nil
        case .price:
            return "price_desc"
        }
    }

    var title: String {
        switch self {
        case .popular:
            return "인기순"
        case .price:
            return "가격순"
        }
    }
}
