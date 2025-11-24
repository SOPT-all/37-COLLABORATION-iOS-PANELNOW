//
//  TabBarController.swift
//  PANELNOW
//
//  Created by 홍준범 on 11/22/25.
//

import UIKit

import SnapKit
import Then

class CustomTabBarController: UIViewController {
    
    private let customTabBar = CustomTabBarView()
    private let contentContainerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        bindTabBarButtonAction()
        showHome()
    }
    
    private func setUI() {
        view.addSubviews(contentContainerView, customTabBar)
    }
    
    private func setLayout() {
        customTabBar.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(-12)
            $0.trailing.equalToSuperview().offset(12)
            $0.height.equalTo(130)
        }
        
        contentContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func bindTabBarButtonAction() {
        customTabBar.homeButtonTapHandler = { [weak self] in
            self?.showHome()
        }
        
        customTabBar.exchangePointButtonTapHandler = { [weak self] in
            self?.showExchangePoint()
        }
    }
    
    private func showHome() {
        let vc = HomeViewController()
        vc.onExchangeButtonTap = { [weak self] in
            self?.showExchangePoint()
            self?.customTabBar.updateButtonStateToExchange()
        }
        setContentView(vc)
    }
    
    private func showExchangePoint() {
        let vc = ExchangeViewController()
        setContentView(vc)
    }
    
    private func setContentView(_ vc: UIViewController) {
        children.forEach {
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        }
        
        addChild(vc)
        contentContainerView.addSubview(vc.view)
        vc.view.snp.makeConstraints { $0.edges.equalToSuperview()}
        vc.didMove(toParent: self)
    }
}
