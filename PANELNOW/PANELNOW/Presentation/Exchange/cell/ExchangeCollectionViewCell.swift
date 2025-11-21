//
//  ExchangeCollectionViewCell.swift
//  PANELNOW
//
//  Created by 박정환 on 11/19/25.
//

import UIKit
import SnapKit

final class ExchangeCollectionViewCell: UICollectionViewCell {
        
    // MARK: - UI Components
    
    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .title_m_14
        label.textColor = .gray06
        label.numberOfLines = 2
        return label
    }()
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.font = .title_m_12
        label.textColor = .gray01
        label.numberOfLines = 1
        return label
    }()
    
    private let pointLabel: UILabel = {
        let label = UILabel()
        label.font = .title_sb_16
        label.textColor = .gray06
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private func setUI() {
        contentView.backgroundColor = .white
    }
    
    private func setHierarchy() {
        contentView.addSubviews(
            thumbnailImageView,
            titleLabel,
            dayLabel,
            pointLabel
        )
    }
    
    private func setLayout() {
        thumbnailImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(thumbnailImageView.snp.width).multipliedBy(116.0 / 160.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
        }
        
        dayLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        pointLabel.snp.makeConstraints {
            $0.top.equalTo(dayLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(titleLabel)
        }
    }
    
    // MARK: - Configure
    
    func configure(with item: ExchangeItemModel) {
        thumbnailImageView.image = item.image
        titleLabel.text = item.title
        dayLabel.text = item.businessDayText
        pointLabel.text = item.pointText
    }
}
