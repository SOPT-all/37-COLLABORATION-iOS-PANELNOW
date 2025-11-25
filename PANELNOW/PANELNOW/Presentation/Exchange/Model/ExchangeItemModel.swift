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

    static let mockData: [ExchangeItemModel] = [
        ExchangeItemModel(
            imageUrl: "https://github.com/user-attachments/assets/fa73d8ac-637c-4f8e-8ba2-a38cbb9dedbb",
            title: "현금 교환",
            businessDayText: "10 영업일 소요",
            point: 2000
        ),
        ExchangeItemModel(
            imageUrl: "https://github.com/user-attachments/assets/75e98198-9982-4a7d-aab3-6a7977923a75",
            title: "굿네이버스 기부",
            businessDayText: "30 영업일 소요",
            point: 100
        ),
        ExchangeItemModel(
            imageUrl: "https://github.com/user-attachments/assets/a5ab1732-2be8-43b4-971d-6df5c8ec8a98",
            title: "네이버페이 포인트쿠폰 3천원권",
            businessDayText: "3 영업일 소요",
            point: 3000
        ),
        ExchangeItemModel(
            imageUrl: "https://github.com/user-attachments/assets/ef2e62c7-3977-4961-9c4a-b3d2aae1ebc9",
            title: "배스킨라빈스 파인트 아이스크림",
            businessDayText: "3 영업일 소요",
            point: 9800
        ),
        ExchangeItemModel(
            imageUrl: "https://github.com/user-attachments/assets/994e7d66-7837-4558-8e2f-09198776a6c5",
            title: "교촌 허니오리지날+콜라 1.25L",
            businessDayText: "3 영업일 소요",
            point: 22000
        ),
        ExchangeItemModel(
            imageUrl: "https://github.com/user-attachments/assets/ce8bb38b-209e-4dc2-ab4a-7eb7371eaf9d",
            title: "네이버페이 포인트쿠폰 5천원권",
            businessDayText: "3 영업일 소요",
            point: 5000
        ),
        ExchangeItemModel(
            imageUrl: "https://github.com/user-attachments/assets/df2a2e5d-a291-4839-b4f8-5da8fb1184d2",
            title: "이디야커피 (L)ICED 아메리카노",
            businessDayText: "3 영업일 소요",
            point: 3200
        ),
        ExchangeItemModel(
            imageUrl: "https://github.com/user-attachments/assets/a2b7fec8-d7e1-4d6f-8089-d57413506823",
            title: "GS25 빙그레 바나나우유 240ML",
            businessDayText: "3 영업일 소요",
            point: 1800
        ),
        ExchangeItemModel(
            imageUrl: "https://github.com/user-attachments/assets/044e93ef-2797-4844-a748-f494f1dbcd4d",
            title: "GS25 오리온 포카칩 오리지널",
            businessDayText: "3 영업일 소요",
            point: 1700
        ),
        ExchangeItemModel(
            imageUrl: "https://github.com/user-attachments/assets/df620e41-e5e8-4cb3-85d8-563817217bdd",
            title: "GS25 삼양 불닭볶음면 (대컵)",
            businessDayText: "3 영업일 소요",
            point: 1800
        ),
        ExchangeItemModel(
            imageUrl: "https://github.com/user-attachments/assets/598170bc-fc3d-4346-b97e-c48269e530aa",
            title: "컬쳐랜드 상품권 3천원권",
            businessDayText: "3 영업일 소요",
            point: 2000
        ),
        ExchangeItemModel(
            imageUrl: "https://github.com/user-attachments/assets/a3445d10-1ba7-4f1b-a27f-4347238ed4c2",
            title: "GS25 코카콜라 슬림캔 250ML",
            businessDayText: "3 영업일 소요",
            point: 1700
        ),
        ExchangeItemModel(
            imageUrl: "https://github.com/user-attachments/assets/48f4eb2f-13cd-4c82-b6ae-2bef54115cdc",
            title: "컬쳐랜드 상품권 5천원권",
            businessDayText: "3 영업일 소요",
            point: 5000
        )
    ]
}

extension ExchangeItemModel {
    init(dto: ProductDTO) {
        self.imageUrl = dto.imageUrl
        self.title = dto.name
        self.businessDayText = dto.day
        self.point = dto.price
    }
}
