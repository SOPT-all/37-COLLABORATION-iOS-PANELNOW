//
//  PopularSurveyView.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class PopularSurveyView: UIView {
    
    // MARK: - Properties
    
    private let surveyData: [(UIImage, String, String, String)] = [
        (.iconCard, "블랙프라이데이 쇼핑 경험", "1분", "100P"),
        (.iconExercise, "운동을 즐겨 하시나요?", "15분", "230P"),
        (.iconMap, "어느 지역에서 생활하시나요?", "23분", "500P")
    ]
    
    // MARK: - UI Components
    
    private let contentLabel = UILabel().then {
        $0.font = .title_sb_16
        $0.textColor = .gray06
        $0.text = "인기 설문"
    }
    
    private let viewAllButton = UIButton(type: .custom).then {
        $0.configuration = .plain()
        $0.configuration?.title = "전체보기"
        $0.configuration?.attributedTitle?.font = .title_m_12
        $0.configuration?.image = .icRightArrow
        $0.configuration?.imagePlacement = .trailing
        $0.configuration?.imagePadding = 4
        $0.configuration?.baseForegroundColor = .gray02
        $0.configuration?.contentInsets = .zero
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 12
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(PopularSurveyCell.self, forCellWithReuseIdentifier: PopularSurveyCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
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
        addSubviews(contentLabel, viewAllButton, collectionView)
    }
    
    private func setLayout() {
        contentLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        viewAllButton.snp.makeConstraints{
            $0.centerY.equalTo(contentLabel)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }
}

extension PopularSurveyView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return surveyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularSurveyCell.identifier, for: indexPath) as? PopularSurveyCell else {
            return UICollectionViewCell()
        }
        
        let data = surveyData[indexPath.item]
        cell.bind(image: data.0, title: data.1, time: data.2, point: data.3)
        
        return cell
    }
}

extension PopularSurveyView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 32
        return CGSize(width: width, height: 72)
    }
}

#Preview {
    PopularSurveyView()
}
