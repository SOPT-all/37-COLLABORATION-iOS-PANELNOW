//
//  ExchangeItemModel.swift
//  PANELNOW
//
//  Created by 박정환 on 11/19/25.
//

import UIKit

struct ExchangeItemModel {
    let image: UIImage
    let title: String
    let businessDays: Int
    let point: Int

    var businessDayText: String {
        "\(businessDays) 영업일 소요"
    }

    var pointText: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let pointString = formatter.string(from: point as NSNumber) ?? "\(point)"
        return "\(pointString)P"
    }

    init(image: UIImage, title: String, businessDays: Int, point: Int) {
        self.image = image
        self.title = title
        self.businessDays = businessDays
        self.point = point
    }

    static let mockData: [ExchangeItemModel] = [
        ExchangeItemModel(
            image: .exchangeImg1,
            title: "현금 교환",
            businessDays: 10,
            point: 2000
        ),
        ExchangeItemModel(
            image: .exchangeImg2,
            title: "굿네이버스 기부",
            businessDays: 30,
            point: 100
        ),
        ExchangeItemModel(
            image: .exchangeImg3,
            title: "네이버페이 포인트쿠폰 3천원권",
            businessDays: 3,
            point: 3000
        ),
        ExchangeItemModel(
            image: .exchangeImg4,
            title: "배스킨라빈스 파인트 아이스크림",
            businessDays: 3,
            point: 9800
        ),
        ExchangeItemModel(
            image: .exchangeImg5,
            title: "교촌 허니오리지날+콜라 1.25L",
            businessDays: 3,
            point: 22000
        ),
        ExchangeItemModel(
            image: .exchangeImg6,
            title: "네이버페이 포인트쿠폰 5천원권",
            businessDays: 3,
            point: 5000
        ),
        ExchangeItemModel(
            image: .exchangeImg7,
            title: "이디야커피 (L)ICED 아메리카노",
            businessDays: 3,
            point: 3200
        ),
        ExchangeItemModel(
            image: .exchangeImg8,
            title: "GS25 빙그레 바나나우유 240ML",
            businessDays: 3,
            point: 1800
        ),
        ExchangeItemModel(
            image: .exchangeImg9,
            title: "GS25 오리온 포카칩 오리지널",
            businessDays: 3,
            point: 1700
        ),
        ExchangeItemModel(
            image: .exchangeImg10,
            title: "GS25 삼양 불닭볶음면 (대컵)",
            businessDays: 3,
            point: 1800
        ),
        ExchangeItemModel(
            image: .exchangeImg11,
            title: "컬쳐랜드 상품권 3천원권",
            businessDays: 3,
            point: 2000
        ),
        ExchangeItemModel(
            image: .exchangeImg12,
            title: "GS25 코카콜라 슬림캔 250ML",
            businessDays: 3,
            point: 1700
        ),
        ExchangeItemModel(
            image: .exchangeImg13,
            title: "컬쳐랜드 상품권 5천원권",
            businessDays: 3,
            point: 5000
        )
    ]
}
