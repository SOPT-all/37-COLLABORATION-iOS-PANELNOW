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
        var config = UIButton.Configuration.plain()
        config.image = .icHome
        config.contentInsets = .zero
        config.imagePadding = 0
        $0.configuration = config
        
        $0.configurationUpdateHandler = { button in
            var updated = button.configuration
            updated?.baseForegroundColor = .clear
            updated?.image = .icHome
            config.contentInsets = .zero
            config.imagePadding = 0
            button.configuration = updated
        }
    }
    
    private lazy var surveyButton = makeTabBarItem(imageName: .icSurvey, selectedImageName: .icSurvey, title: "설문조사")
    private lazy var eventButton = makeTabBarItem(imageName: .icEvent, selectedImageName: .icEvent, title: "이벤트")
    private lazy var exchangePointButton = makeTabBarItem(imageName: .icExchange, selectedImageName: .icExchangeFill, title: "포인트 교환")
    private lazy var myActivityButton = makeTabBarItem(imageName: .icActivity, selectedImageName: .icActivity, title: "내 활동")
    
    var exchangePointButtonTapHandler: (() -> Void)?
    var homeButtonTapHandler: (() -> Void)?
    
    private let leftStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 14
    }
    
    private let rightStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 2
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
        exchangePointButton.isSelected = true
        exchangePointButtonTapHandler?()
    }
    
    @objc
    private func didTapHome() {
        exchangePointButton.isSelected = false
        homeButtonTapHandler?()
    }
    
    private func makeTabBarItem(imageName: UIImage?, selectedImageName: UIImage?, title: String) -> UIButton {
        
        var config = UIButton.Configuration.plain()
        config.imagePlacement = .top
        config.imagePadding = 6
        config.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0)
        config.background.backgroundColor = .clear
        
        var attributes = AttributeContainer()
        attributes.font = .body_r_14
        attributes.foregroundColor = .gray02
   
        let button = UIButton(type: .custom)
        button.configuration = config
        
        button.setImage(imageName, for: .normal)
        button.setImage(selectedImageName, for: .selected)
        
        button.setTitle(title, for: .normal)
        button.setTitle(title, for: .selected)
        button.titleLabel?.font = .body_r_14
        button.setTitleColor(.gray02, for: .normal)
        button.setTitleColor(.mainBlue, for: .selected)
        
        return button
    }
    
    func updateButtonStateToExchange() {
        homeButton.isSelected = false
        exchangePointButton.isSelected = true
    }
}

#Preview {
    CustomTabBarView()
}
