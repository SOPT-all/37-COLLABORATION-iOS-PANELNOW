//
//  MiniTestView.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class MiniTestView: UIView {
    
    // MARK: - Properties
    
    private let testData: [(String, String, String)] = [
        ("50초", "겨울에도 아이스 아메리카노를\n드시나요?", "25P"),
        ("50초", "요즘 당신의 시간 순삭템은\n무엇인가요?", "25P"),
    ]
    
    // MARK: - UI Components
    
    private let contentLabel = UILabel().then {
        $0.font = .title_sb_16
        $0.textColor = .gray06
        $0.text = "미니 테스트"
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(MiniTestCell.self, forCellWithReuseIdentifier: MiniTestCell.identifier)
        
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
        addSubviews(contentLabel, collectionView)
    }
    
    private func setLayout() {
        contentLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(contentLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(168)
        }
    }
}

extension MiniTestView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiniTestCell.identifier, for: indexPath) as? MiniTestCell else {
            return UICollectionViewCell()
        }
        
        let data = testData[indexPath.item]
        cell.bind(time: data.0, title: data.1, point: data.2)
        
        return cell
    }
}

extension MiniTestView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 168)
    }
}

#Preview {
    MiniTestView()
}
