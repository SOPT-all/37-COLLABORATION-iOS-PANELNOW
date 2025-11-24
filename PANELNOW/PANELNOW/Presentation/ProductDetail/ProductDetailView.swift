//
//  ProductDetailView.swift
//  PANELNOW
//
//  Created by 홍준범 on 11/20/25.
//

import UIKit

import SnapKit
import Then

protocol ProductDetailViewDelegate: AnyObject {
    func didTapBackButton()
}

class ProductDetailView: UIView {
    
    weak var delegate: ProductDetailViewDelegate?
    
    private let backButton = UIButton().then {
        $0.setImage(.icBack, for: .normal)
    }
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        tableView.sectionHeaderTopPadding = 0
        tableView.bounces = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let bottomContainerView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowOffset = CGSize(width: 0, height: -4)
        $0.layer.shadowRadius = 6
    }
    
    private let bottomButton = BottomButtonView()
    
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
        backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    private func setUI() {
        bottomContainerView.addSubview(bottomButton)
        addSubviews(backButton, tableView, bottomContainerView)
    }
    
    private func setLayout() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.leading.equalToSuperview().inset(12)
            $0.size.equalTo(24)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomContainerView.snp.top)
        }
        
        bottomContainerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        bottomButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func backButtonTapped() {
        delegate?.didTapBackButton()
    }
}
