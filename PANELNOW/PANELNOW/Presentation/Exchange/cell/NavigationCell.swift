//
//  NavigationBarswift.swift
//  PANELNOW
//
//  Created by 박정환 on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class NavigationCell: UICollectionViewCell {

    private let titleLabel = UILabel().then {
        $0.text = "포인트 교환"
        $0.font = .title_sb_16
        $0.textColor = .gray06
    }

    private let alarmButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "ic_alarm"), for: .normal)
    }

    private let infoButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "ic_info"), for: .normal)
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(alarmButton)
        contentView.addSubview(infoButton)
    }
    
    private func setStyle() {
        contentView.backgroundColor = .gray04
    }

    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(28)
        }

        infoButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(titleLabel)
            $0.width.height.equalTo(24)
        }

        alarmButton.snp.makeConstraints {
            $0.trailing.equalTo(infoButton.snp.leading).offset(-16)
            $0.centerY.equalTo(titleLabel)
            $0.width.height.equalTo(24)
        }
    }
}
