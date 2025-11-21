//
//  PointBadge.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/21/25.
//

import UIKit

import SnapKit
import Then

final class PointBadge: UIView {
    
    // MARK: - UI Components
    
    private let pointLabel = UILabel().then {
        $0.font = .title_m_12
        $0.textColor = .mainBlue
        $0.textAlignment = .center
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Methods
    
    private func setStyle() {
        self.backgroundColor = .subBlue
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
    }
    
    private func setUI() {
        addSubview(pointLabel)
    }
    
    private func setupLayout() {
        pointLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        self.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.width.greaterThanOrEqualTo(48)
        }
    }
    
    func setText(_ text: String) {
        pointLabel.text = text
    }
}
