//
//  InformationCell.swift
//  PANELNOW
//
//  Created by 홍준범 on 11/19/25.
//

import UIKit

import SnapKit
import Then

class InformationCell: BaseUITableViewCell {
    
    private let labelContainerStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 4
        $0.distribution = .equalSpacing
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "이용 안내"
        $0.font = .title_sb_16
        $0.textColor = .gray06
    }
    
    private let firstTitleLabel = UILabel().then {
        $0.text = "▶﻿﻿충전권 이용안내"
        $0.font = .body_r_14
        $0.textColor = .gray06
    }
    
    private let firstContentLabel = UILabel().then {
        $0.text = "네이버페이 포인트는 네이버쇼핑/네이버웹툰/네이버예약을 비\n롯한 45 만개 이상 가맹점에서 현금처럼 이용하실 수 있습니다."
        $0.numberOfLines = 2
        $0.font = .body_r_14
        $0.textColor = .gray06
    }
    
    private let secondTitleLabel = UILabel().then {
        $0.text = "▶﻿﻿사용방법"
        $0.font = .body_r_14
        $0.textColor = .gray06
    }
    
    private let secondContentLabel = UILabel().then {
        $0.text = "모바일 : 네이버페이>우상단 삼선메뉴(=)클릭>결제>쿠폰>\n쿠폰 등록\n\nhttps://new-m.pay.naver.com/pay-point-convert-in/pointcoupon?couponNo\n\nPC : 네이버페이 > 우측(하단)쿠폰 > 쿠폰등록"
        $0.numberOfLines = 8
        $0.font = .body_r_14
        $0.textColor = .gray06
    }
    
    private let thirdTitleLabel = UILabel().then {
        $0.text = "▶﻿﻿이용가이드"
        $0.font = .body_r_14
        $0.textColor = .gray06
    }
    
    private let thirdContentLabel = UILabel().then {
        $0.text = "포인트는 1인당 최대 200만원까지 보유하실 수 있습니다.\n\n쿠폰이 정상적으로 등록된 경우, 네이버페이>포인트 메뉴에서 내역을 확인하실 수 있습니다.\n\n(반영에 최대 1분이 소요됩니다)\n\n쿠폰으로 등록된 금액은 적립포인트로 지급되며, 취소 및 현금 인출이 불가합니다.\n\n일부 페이 가맹점에서는 포인트 사용이 제한될 수 있습니다."
        $0.numberOfLines = 12
        $0.font = .body_r_14
        $0.textColor = .gray06
    }
    
    override func setStyle() {
        selectionStyle = .none
        backgroundColor = .white
    }
    
    override func setUI() {
        labelContainerStackView.addArrangedSubviews(titleLabel, firstTitleLabel, firstContentLabel, secondTitleLabel, secondContentLabel, thirdTitleLabel, thirdContentLabel)
        
        contentView.addSubviews(labelContainerStackView)
    }
    
    override func setLayout() {
        labelContainerStackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(contentView).inset(16)
            $0.top.equalTo(contentView).inset(35)
            $0.bottom.equalTo(contentView).inset(43)
        }
    }
    
    func configure(with data: ProductDetailDTO) {
        let sections = data.infoSections
        
        firstTitleLabel.text = "▶"+sections[0].label
        firstContentLabel.text = sections[0].content
        
        secondTitleLabel.text = "▶"+sections[1].label
        secondContentLabel.text = sections[1].content
        
        thirdTitleLabel.text = "▶"+sections[2].label
        thirdContentLabel.text = sections[2].content
    }
}
