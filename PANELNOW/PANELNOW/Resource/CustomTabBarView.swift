//
//  CustomTabBarView.swift
//  PANELNOW
//
//  Created by 홍준범 on 11/21/25.
//

import UIKit

import SnapKit
import Then

final class CustomTabBarView: UIView {
    
    private let tabBarBackgroundView = UIImageView().then {
        $0.image = .tabbarBackground
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let homeButton = UIButton().then {
        $0.setImage(.icHome, for: .normal)
    }
    
    private lazy var surveyButton = makeTabBarItem(imageName: .icSurvey, title: "설문조사")
    private lazy var eventButton = makeTabBarItem(imageName: .icEvent, title: "이벤트")
    private lazy var exchangePointButton = makeTabBarItem(imageName: .icExchange, title: "포인트 교환")
    private lazy var myActivityButton = makeTabBarItem(imageName: .icActivity, title: "내 활동")
    
    var exchangePointButtonTapHandler: (() -> Void)?
    var homeButtonTapHandler: (() -> Void)?
    
    private let leftStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 20
    }
    
    private let rightStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 18
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.backgroundColor = .clear
        self.insetsLayoutMarginsFromSafeArea = false
    }
    
    private func setUI() {
        leftStackView.addArrangedSubviews(surveyButton, eventButton)
        
        rightStackView.addArrangedSubviews(exchangePointButton, myActivityButton)
        
        self.addSubviews(tabBarBackgroundView, homeButton, leftStackView, rightStackView)
    }
    
    private func setLayout() {
        tabBarBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(-12)
            $0.trailing.equalToSuperview().offset(12)
        }
        
        homeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(tabBarBackgroundView.snp.top).offset(2)
        }
        
        leftStackView.snp.makeConstraints {
            $0.leading.equalTo(tabBarBackgroundView.snp.leading).inset(46)
            $0.centerY.equalToSuperview().offset(-10)
        }
        
        rightStackView.snp.makeConstraints {
            $0.trailing.equalTo(tabBarBackgroundView.snp.trailing).inset(32)
            $0.centerY.equalToSuperview().offset(-10)
        }
    }
    
    private func setAddTarget() {
        exchangePointButton.addTarget(self, action: #selector(didTapExchangePoint), for: .touchUpInside)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc
    private func didTapExchangePoint() {
        exchangePointButtonTapHandler?()
    }
    
    @objc
    private func didTapHome() {
        homeButtonTapHandler?()
    }
    
    private func makeTabBarItem(imageName: UIImage?, title: String) -> UIButton {
        
        var config = UIButton.Configuration.plain()
        config.image = imageName
        config.title = title
        config.baseForegroundColor = .gray02
        config.imagePlacement = .top
        config.imagePadding = 6
        
        var attributes = AttributeContainer()
        attributes.font = .body_r_14
        attributes.foregroundColor = .gray02
        
        config.attributedTitle = AttributedString(title, attributes: attributes)
        config.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0)
        
        let button = UIButton(type: .custom)
        button.configuration = config
        
        return button
    }
}

#Preview {
    CustomTabBarView()
}
