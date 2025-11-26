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
    
    // MARK: - Properties
    
    var onExchangeButtonTap: ((PointData?) -> Void)?
    var onDataFetched: ((PointData) -> Void)?
    private var cachedPointData: PointData?
    
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
        fetchData()
    }
    
    // MARK: - Setting Methods
    
    private func setStyle() {
        view.backgroundColor = .gray04
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
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
            $0.top.equalToSuperview().offset(56)
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
            $0.bottom.equalToSuperview().inset(130)
        }
    }
    
    private func setDelegate() {
        myPointView.delegate = self
    }
    
    private func fetchData() {
        Task { [weak self] in
            guard let self = self else { return }
            
            do {
                let pointData = try await HomeService.shared.fetchHome()
                self.updateUI(with: pointData)
                
            } catch {
                print("홈 유저 포인트 불러오기 실패: \(error)")
            }
        }
    }
    
    @MainActor
    private func updateUI(with data: PointData) {
        self.cachedPointData = data
        self.myPointView.configure(with: data)
        onDataFetched?(data)
    }
}

extension HomeViewController: MyPointViewDelegate {
    func didTapExchangeButton() {
        onExchangeButtonTap?(self.cachedPointData)
    }
}

#Preview {
    HomeViewController()
}
