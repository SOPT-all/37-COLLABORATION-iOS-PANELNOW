//
//  HomeViewController.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let headerView = HeaderView()
    private let myPointView = MyPointView()
    private let popularSurveyView = PopularSurveyView()
    private let miniTestView = MiniTestView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setDelegate()
    }
    
    // MARK: - Setting Methods
    
    private func setStyle() {
        view.backgroundColor = .gray04
        scrollView.showsVerticalScrollIndicator = false
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setUI() {
        view.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            headerView,
            myPointView,
            popularSurveyView,
            miniTestView
        )
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        myPointView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
        }
        
        popularSurveyView.snp.makeConstraints {
            $0.top.equalTo(myPointView.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
        }
        
        miniTestView.snp.makeConstraints {
            $0.top.equalTo(popularSurveyView.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(43)
        }
    }
    
    private func setDelegate() {
        myPointView.delegate = self
    }
}

extension HomeViewController: MyPointViewDelegate {
    func didTapExchangeButton() {
        // TODO: ExchangeViewController 네비게이션 구현
    }
}

#Preview {
    HomeViewController()
}
