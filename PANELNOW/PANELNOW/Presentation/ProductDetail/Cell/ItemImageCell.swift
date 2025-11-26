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
            $0.edges.equalToSuperview().inset(36)
        }
    }
    
    func configure(with data: ProductDetailDTO) {
        guard let url = URL(string: data.imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let self,
                  let data,
                  let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.itemImage.image = image
            }
        }.resume()
    }
}
