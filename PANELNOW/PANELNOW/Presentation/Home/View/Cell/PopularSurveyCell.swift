//
//  PopularSurveyCell.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/21/25.
//

import UIKit

import SnapKit
import Then

class PopularSurveyCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let iconImageView = UIImageView().then {
        $0.image = UIImage(resource: .iconCard)
        $0.contentMode = .scaleAspectFit
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "블랙프라이데이 쇼핑 경험"
        $0.font = .title_sb_16
        $0.textColor = .gray06
        $0.numberOfLines = 1
    }
    
    private let timeLabel = UILabel().then {
        $0.text = "1분"
        $0.font = .title_m_14
        $0.textColor = .gray01
    }
    
    private let pointBadge = PointBadge()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Methods
    
    private func setUI() {
        addSubviews(iconImageView, titleLabel,
                    timeLabel,pointBadge)
    }
    
    private func setLayout() {
        iconImageView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.size.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(iconImageView)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(14)
        }
        
        timeLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.bottom.equalToSuperview().inset(16)
            $0.leading.equalTo(titleLabel)
        }
        
        pointBadge.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
    
    func bind(image: UIImage, title: String, time: String, point: String) {
        iconImageView.image = image
        titleLabel.text = title
        timeLabel.text = time
        pointBadge.setText(point)
    }
}
