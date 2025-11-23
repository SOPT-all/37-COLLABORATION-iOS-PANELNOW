//
//  ItemNameAndPointCell.swift
//  PANELNOW
//
//  Created by 홍준범 on 11/19/25.
//

import UIKit

import SnapKit
import Then

class ItemNameAndPointCell: BaseUITableViewCell {
     
    private let itemNameLabel = UILabel().then {
        $0.text = "네이버페이 포인트쿠폰 5천원권"
        $0.font = .title_sb_20
        $0.textColor = .gray06
    }
    
    private let informationLabel = UILabel().then {
        $0.text = "포인트를 모바일 쿠폰으로 교환해보세요!\n더 편리하게 패널나우 포인트를 사용할 수 있어요."
        $0.numberOfLines = 2
        $0.font = .title_m_12
        $0.textColor = .gray01
    }
    
    private let point = UILabel().then {
        $0.text = "5,000원"
        $0.font = .title_bd_24
        $0.textColor = .mainBlue
    }
    
    private let containerStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 0
        $0.distribution = .fillEqually
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .gray04
    }
    
    private let placeInfoStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
    }
    
    private let receivePlaceLabel = UILabel().then {
        $0.text = "받으실 곳"
        $0.font = .title_m_14
        $0.textColor = .gray01
    }
    
    private let arrowImageView = UIImageView().then {
        $0.image = .icRightArrow2
        $0.tintColor = .gray02
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var phoneNumberLabel = UILabel().then {
        $0.text = maskPhoneNumber("01012345678")
        $0.font = .body_r_16
        $0.textColor = .gray06
    }
    
    private let dateInfoStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 12
    }
    
    private let expectedDateLabel = UILabel().then {
        $0.text = "교환 예정일"
        $0.font = .title_m_14
        $0.textColor = .gray01
    }
    
    private let dateLabel = UILabel().then {
        $0.text = "2025. 12. 31"
        $0.font = .body_r_16
        $0.textColor = .mainBlue
    }
    
    override func setStyle() {
        backgroundColor = .white
        selectionStyle = .none
        
        containerStackView.isLayoutMarginsRelativeArrangement = true
        containerStackView.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    }
    
    override func setUI() {
        placeInfoStackView.addArrangedSubviews(receivePlaceLabel, phoneNumberLabel, arrowImageView)
        
        dateInfoStackView.addArrangedSubviews(expectedDateLabel, dateLabel)
        
        containerStackView.addArrangedSubviews(placeInfoStackView, dateInfoStackView)
        
        contentView.addSubviews(itemNameLabel, informationLabel, point, containerStackView)
    }
    
    override func setLayout() {
        itemNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        informationLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(itemNameLabel.snp.bottom).offset(17)
        }
        
        point.snp.makeConstraints {
            $0.top.equalTo(informationLabel.snp.bottom).offset(17)
            $0.leading.equalToSuperview().inset(16)
        }
        
        containerStackView.snp.makeConstraints {
            $0.top.equalTo(point.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(112)
            $0.bottom.equalToSuperview().inset(26)
        }
    }
    
    private func maskPhoneNumber(_ phoneNumber: String) -> String {
        let digits = phoneNumber.filter { $0.isNumber }
        guard digits.count >= 6 else { return phoneNumber }
        
        let prefix = digits.prefix(digits.count - 6)
        return prefix + "******"
    }
}
