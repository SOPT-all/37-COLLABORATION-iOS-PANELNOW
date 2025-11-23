//
//  ItemImageCell.swift
//  PANELNOW
//
//  Created by 홍준범 on 11/19/25.
//

import UIKit

import SnapKit
import Then

class ItemImageCell: BaseUITableViewCell {
    
    private let itemImage = UIImageView().then {
        $0.image = .exchangeBigImg1
        $0.contentMode = .scaleAspectFit
    }
    
    override func setStyle() {
        selectionStyle = .none
        backgroundColor = .white
    }
    
    override func setUI() {
        contentView.addSubview(itemImage)
    }
    
    override func setLayout() {
        itemImage.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
