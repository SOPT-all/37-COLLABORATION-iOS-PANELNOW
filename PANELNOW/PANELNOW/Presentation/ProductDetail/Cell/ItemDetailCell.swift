//
//  itemDetailCell.swift
//  PANELNOW
//
//  Created by 홍준범 on 11/19/25.
//

import UIKit

import SnapKit
import Then

class ItemDetailCell: BaseUITableViewCell {
    
    private let titleLabel = UILabel().then {
        $0.text = "상품 상세"
        $0.font = .title_sb_16
        $0.textColor = .gray06
    }
    
    private let labelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 12
        $0.distribution = .fillProportionally
    }
    
    private let label1 = UILabel().then {
        $0.text = "· 포인트 교환 신청 후 변경 또는 취소가 불가합니다."
        $0.font = .body_r_14
        $0.textColor = .gray06
    }
    
    private let label2 = UILabel().then {
        $0.text = "· 교환 예정일에 등록된 휴대폰 번호로 쿠폰번호가\n  MMS가 발송됩니다."
        $0.numberOfLines = 2
        $0.font = .body_r_14
        $0.textColor = .gray06
    }
    
    private let label3 = UILabel().then {
        $0.text = "· 쿠폰 유효기간은 교환 일로부터 30일 이내이며 연장\n  불가 상품입니다. 자세한 사항은 교환 후 문자 메시지를\n  통해 확인해 주세요."
        $0.numberOfLines = 3
        $0.font = .body_r_14
        $0.textColor = .gray06
    }
    
    override func setStyle() {
        selectionStyle = .none
        backgroundColor = .white
    }
    
    override func setUI() {
        labelStackView.addArrangedSubview(label1)
        labelStackView.addArrangedSubview(label2)
        labelStackView.addArrangedSubview(label3)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(labelStackView)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(contentView).inset(16)
            $0.top.equalTo(contentView).inset(19)
            $0.height.equalTo(14)
        }
        
        labelStackView.snp.makeConstraints {
            $0.leading.equalTo(contentView).inset(28)
            $0.trailing.equalTo(contentView).inset(16)
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
        }
    }
}
