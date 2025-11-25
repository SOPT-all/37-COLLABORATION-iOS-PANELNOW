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

    private let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
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
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private func setUI() {
        contentView.addSubviews(
            containerView,
            titleLabel,
            dayLabel,
            pointLabel
        )
        containerView.addSubview(thumbnailImageView)
    }
    
    private func setStyle() {
        contentView.backgroundColor = .white
        
        containerView.backgroundColor = .gray04
        containerView.layer.cornerRadius = 12
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.gray01.cgColor
        containerView.layer.masksToBounds = true
    }
    
    private func setLayout() {
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(containerView.snp.width).multipliedBy(116.0 / 160.0)
        }
        
        thumbnailImageView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.bottom).offset(16)
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
        if let url = URL(string: item.imageUrl) {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                guard let self = self,
                      let data = data,
                      let image = UIImage(data: data) else { return }
              
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }.resume()
        } else {
            thumbnailImageView.image = nil
        }
        
        titleLabel.text = item.title
        dayLabel.text = item.businessDayText
        pointLabel.text = item.pointText
    }
}
