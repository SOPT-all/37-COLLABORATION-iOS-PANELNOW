//
//  MiniTestCell.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/21/25.
//

import UIKit

import SnapKit
import Then

class MiniTestCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let secondsLabel = UILabel().then {
        $0.text = "50초"
        $0.font = .title_m_12
        $0.textColor = .gray01
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "블랙프라이데이 쇼핑 경험"
        $0.font = .title_sb_16
        $0.textColor = .gray06
        $0.numberOfLines = 2
    }
    
    private let pointBadge = PointBadge()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Methods
    
    private func setStyle() {
        layer.cornerRadius = 20
        backgroundColor = .white
    }
    
    private func setUI() {
        addSubviews(secondsLabel, titleLabel,
                    pointBadge)
    }
    
    private func setLayout() {
        secondsLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(25)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(secondsLabel.snp.bottom).offset(12)
            $0.leading.equalTo(secondsLabel)
        }
        
        pointBadge.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(45)
            $0.bottom.equalToSuperview().inset(14)
            $0.leading.equalTo(secondsLabel)
        }
    }
    
    func bind(time: String, title: String, point: String) {
        secondsLabel.text = time
        titleLabel.text = title
        pointBadge.setText(point)
    }
}
