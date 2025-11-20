//
//  HeaderView.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class HeaderView: UIView {
    
    private let logoView = UIImageView().then {
        $0.image = .panelnowLogo
        $0.contentMode = .scaleAspectFit
    }
    
    private let alarmButton = UIButton(type: .custom).then {
        $0.setImage(.icAlarm, for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
    private let infoButton = UIButton(type: .custom).then {
        $0.setImage(.icInfo, for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
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
        backgroundColor = .gray04
    }
    
    private func setUI() {
        addSubviews(logoView, alarmButton, infoButton)
    }
    
    private func setLayout() {
        logoView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview()
        }
        
        alarmButton.snp.makeConstraints{
            $0.trailing.equalTo(infoButton.snp.leading).offset(-16)
            $0.centerY.equalTo(logoView)
            $0.size.equalTo(24)
        }
        
        infoButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(logoView)
            $0.size.equalTo(24)
        }
    }
}

#Preview {
    HeaderView()
}
