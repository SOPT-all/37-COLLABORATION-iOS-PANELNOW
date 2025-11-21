//
//  SortCell.swift
//  PANELNOW
//
//  Created by 박정환 on 11/19/25.
//

import UIKit


import SnapKit
import Then

protocol SortCellDelegate: AnyObject {
    func sortCellDidTapSort(_ cell: SortCell)
}

final class SortCell: UICollectionViewCell {

    weak var delegate: SortCellDelegate?

    private let containerView = UIView().then {
        $0.backgroundColor = .white
    }

    let sortButton = UIButton(type: .system).then {
        $0.setTitle("인기순", for: .normal)
        $0.setTitleColor(.gray06, for: .normal)
        $0.titleLabel?.font = .title_m_14
        $0.layer.cornerRadius = 18
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray01.cgColor
        $0.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        $0.contentHorizontalAlignment = .left

        let config = UIImage.SymbolConfiguration(pointSize: 9, weight: .bold)
        let image = UIImage(systemName: "chevron.down", withConfiguration: config)
        $0.setImage(image, for: .normal)
        $0.tintColor = .gray06

        // 아이콘을 텍스트 오른쪽에 오게 하기
        $0.semanticContentAttribute = .forceRightToLeft

        // 텍스트와 아이콘 사이 여백
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: -12)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
        setAddTarget()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(sortButton)
    }
    
    private func setStyle() {
        contentView.backgroundColor = .white
    }

    private func setLayout() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        sortButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(32)
            $0.width.equalTo(94)
        }
    }
    
    private func setAddTarget() {
        sortButton.addTarget(self, action: #selector(didTapSortButton), for: .touchUpInside)
    }

    func configure(option: SortOption) {
        sortButton.setTitle(option.title, for: .normal)
    }
    
    @objc private func didTapSortButton() {
        delegate?.sortCellDidTapSort(self)
    }
}
