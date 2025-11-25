//
//  ExchangeItemModel.swift
//  PANELNOW
//
//  Created by 박정환 on 11/19/25.
//

import UIKit

struct ExchangeItemModel {
    let imageUrl: String
    let title: String
    let businessDayText: String
    let point: Int

    var businessDayTextDescription: String {
        businessDayText
    }

    var pointText: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let pointString = formatter.string(from: point as NSNumber) ?? "\(point)"
        return "\(pointString)P"
    }

    init(imageUrl: String, title: String, businessDayText: String, point: Int) {
        self.imageUrl = imageUrl
        self.title = title
        self.businessDayText = businessDayText
        self.point = point
    }
}

extension ExchangeItemModel {
    init(dto: ProductDTO) {
        self.imageUrl = dto.imageUrl
        self.title = dto.name
        self.businessDayText = dto.day
        self.point = dto.price
    }
}
