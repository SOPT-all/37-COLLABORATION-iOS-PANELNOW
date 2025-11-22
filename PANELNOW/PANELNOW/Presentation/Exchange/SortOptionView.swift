//
//  SortOptionView.swift
//  PANELNOW
//
//  Created by 박정환 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class SortOptionView: UIView {

    var didSelect: ((SortOption) -> Void)?

    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 0
        $0.distribution = .fillEqually
    }

    private let priceButton = UIButton(type: .system).then {
        $0.setTitle("가격순", for: .normal)
        $0.titleLabel?.font = .title_m_14
        $0.setTitleColor(.gray06, for: .normal)
    }

    private let popularButton = UIButton(type: .system).then {
        $0.setTitle("인기순", for: .normal)
        $0.titleLabel?.font = .title_m_14
        $0.setTitleColor(.gray06, for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
        setStyle()
        setLayout()
        setAddTarget()
    }

    private func setUI() {
        addSubview(stackView)
        stackView.addArrangedSubview(priceButton)
        stackView.addArrangedSubview(popularButton)
    }
    
    private func setStyle() {
        backgroundColor = .white
        layer.cornerRadius = 18
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray01.cgColor
        clipsToBounds = true
    }

    private func setLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func setAddTarget() {
        priceButton.addTarget(self, action: #selector(didTapPrice), for: .touchUpInside)
        popularButton.addTarget(self, action: #selector(didTapPopular), for: .touchUpInside)
    }

    @objc private func didTapPrice() {
        didSelect?(.price)
    }

    @objc private func didTapPopular() {
        didSelect?(.popular)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
