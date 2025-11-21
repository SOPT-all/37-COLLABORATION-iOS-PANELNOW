//
//  MyPointView.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class MyPointView: UIView {
    
    // MARK: - UI Components
    
    private let contentLabel = UILabel().then {
        $0.font = .title_sb_16
        $0.textColor = .gray06
        $0.text = "포인트 내역"
    }
    
    private let characterImage = UIImageView().then {
        $0.image = .mainImg
        $0.contentMode = .scaleAspectFit
    }
    
    private let pointView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    
    private let pointImage = UIImageView().then {
        $0.image = .icMyPoint
        $0.contentMode = .scaleAspectFit
    }
    
    private let myPointLabel = UILabel().then {
        $0.font = .title_sb_16
        $0.textColor = .gray06
        $0.text = "나의 포인트"
    }
    
    private let currentPointLabel = UILabel().then {
        $0.font = .title_bd_24
        $0.textColor = .gray06
        $0.text = "4,500P" // TODO: API 바인딩
    }
    
    private let pointArrowImage = UIImageView().then {
        $0.image = .icRightArrow
        $0.contentMode = .scaleAspectFit
    }
    
    private let exchangeButton = UIButton(type: .custom).then {
        $0.setImage(.btnExchange, for: .normal)
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
        addSubviews(contentLabel, characterImage, pointView)
        pointView.addSubviews(pointImage, myPointLabel,
                              currentPointLabel, pointArrowImage,
                              exchangeButton)
    }
    
    private func setLayout() {
        contentLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(34)
            $0.leading.equalToSuperview().inset(16)
        }
        
        characterImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(138)
            $0.height.equalTo(64)
        }
        
        pointView.snp.makeConstraints {
            $0.top.equalTo(characterImage.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(111)
        }
        
        pointImage.snp.makeConstraints{
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }
        
        myPointLabel.snp.makeConstraints {
            $0.centerY.equalTo(pointImage)
            $0.leading.equalTo(pointImage.snp.trailing).offset(11)
        }
        
        currentPointLabel.snp.makeConstraints{
            $0.top.equalTo(pointImage.snp.bottom).offset(10)
            $0.leading.equalTo(pointImage)
        }
        
        pointArrowImage.snp.makeConstraints{
            $0.centerY.equalTo(currentPointLabel)
            $0.leading.equalTo(currentPointLabel.snp.trailing).offset(10)
            $0.size.equalTo(24)
        }
        
        exchangeButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}

#Preview {
    MyPointView()
}
