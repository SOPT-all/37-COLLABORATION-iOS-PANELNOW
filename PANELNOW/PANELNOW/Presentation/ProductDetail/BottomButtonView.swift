//
//  BottomButtonView.swift
//  PANELNOW
//
//  Created by 홍준범 on 11/20/25.
//

import UIKit

import SnapKit
import Then

enum State {
    case possible(currentPoint: Int)
    case notPossible(lackingPoint: Int)
}

protocol BottomButtonViewDelegate: AnyObject {
    func didTapExchangeButton()
}

final class BottomButtonView: UIView {
    
    weak var delegate: BottomButtonViewDelegate?
    
    private let notPossibleButton = UIButton().then {
        $0.setTitle("500 포인트가 부족해요", for: .disabled)
        $0.setTitleColor(.white, for: .disabled)
        $0.isEnabled = false
        $0.titleLabel?.font = .title_sb_16
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .gray02
    }
    
    private let possibleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 44
        $0.distribution = .fill
    }
    
    private let pointStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.alignment = .center
        $0.distribution = .fill
    }
    
    private let pointImage = UIImageView().then {
        $0.image = .icInfo
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    private let pointLabel = UILabel().then {
        $0.text = "나의 포인트"
        $0.font = .body_r_14
        $0.textColor = .gray02
    }
    
    private let point = UILabel().then {
        $0.text = "4,500P"
        $0.font = .body_r_14
        $0.textColor = .mainBlue
    }
    
    private let possibleButton = UIButton().then {
        $0.setTitle("교환하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .body_r_16
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        $0.layer.cornerRadius = 20
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowOffset = CGSize(width: 0, height: -4)
        $0.backgroundColor = .mainBlue
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        pointStackView.addArrangedSubviews(pointImage ,pointLabel, point)
        possibleStackView.addArrangedSubviews(pointStackView, possibleButton)
        addSubviews(notPossibleButton, possibleStackView)
    }
    
    func setLayout() {
        notPossibleButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(14)
            $0.height.equalTo(44)
        }
        
        possibleStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(16)
        }
        
        pointImage.snp.makeConstraints {
            $0.width.height.equalTo(20)
        }
        
        possibleButton.snp.makeConstraints {
            $0.width.equalTo(176)
            $0.height.equalTo(40)
        }
    }
    
    func setAddTarget() {
        possibleButton.addTarget(self, action: #selector(didTapPossibleButton), for: .touchUpInside)
    }
    
    @objc
    func didTapPossibleButton() {
        delegate?.didTapExchangeButton()
    }
    
    func configure(state: State) {
        switch state {
        case .possible(let currentPoint):
            notPossibleButton.isHidden = true
            possibleStackView.isHidden = false
            point.text = "\(currentPoint)P"
        case .notPossible(let lackingPoint):
            notPossibleButton.isHidden = false
            possibleStackView.isHidden = true
            notPossibleButton.setTitle("\(lackingPoint) 포인트가 부족해요", for: .disabled)
        }
    }
}
