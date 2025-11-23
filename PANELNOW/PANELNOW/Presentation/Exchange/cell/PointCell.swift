//
//  PointCell.swift
//  PANELNOW
//
//  Created by 박정환 on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class PointCell: UICollectionViewCell {

    private let pointIconImageView = UIImageView().then {
        $0.image = .icMyPoint
        $0.contentMode = .scaleAspectFit
    }

    private let titleLabel = UILabel().then {
        $0.text = "나의 포인트"
        $0.font = .title_sb_16
        $0.textColor = .gray06
    }

    private let pointLabel = UILabel().then {
        $0.font = .title_bd_24
        $0.textColor = .gray06
    }

    private let arrowImageView = UIImageView().then {
        $0.image = .icRightArrow
        $0.tintColor = .gray02
        $0.contentMode = .scaleAspectFit
    }

    private let exchangedTitleLabel = UILabel().then {
        $0.text = "현재까지 교환한 포인트"
        $0.font = .title_m_14
        $0.textColor = .gray01
    }

    private let exchangedPointLabel = UILabel().then {
        $0.font = .title_m_14
        $0.textColor = .mainBlue
    }

    private let mainImageView = UIImageView().then {
        $0.image = UIImage(named: "mainImg")
        $0.contentMode = .scaleAspectFit
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        contentView.addSubviews(pointIconImageView, titleLabel, pointLabel, arrowImageView, exchangedTitleLabel, exchangedPointLabel, mainImageView)
    }
    
    private func setStyle() {
        contentView.backgroundColor = .gray04
    }

    private func setLayout() {
        pointIconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }

        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(pointIconImageView)
            $0.leading.equalTo(pointIconImageView.snp.trailing).offset(11)
        }

        pointLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(16)
        }

        arrowImageView.snp.makeConstraints {
            $0.centerY.equalTo(pointLabel)
            $0.leading.equalTo(pointLabel.snp.trailing).offset(10)
            $0.size.equalTo(24)
        }

        exchangedTitleLabel.snp.makeConstraints {
            $0.top.equalTo(pointLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
        }

        exchangedPointLabel.snp.makeConstraints {
            $0.centerY.equalTo(exchangedTitleLabel)
            $0.leading.equalTo(exchangedTitleLabel.snp.trailing).offset(4)
        }

        mainImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(138)
        }
    }

    func configure(point: Int, exchangedPoint: Int) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        let pointString = formatter.string(from: point as NSNumber) ?? "\(point)"
        let exchangedString = formatter.string(from: exchangedPoint as NSNumber) ?? "\(exchangedPoint)"

        pointLabel.text = "\(pointString)P"
        exchangedPointLabel.text = "\(exchangedString)P"
    }
}
