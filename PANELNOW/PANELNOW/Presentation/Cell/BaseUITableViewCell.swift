//
//  BaseUITableViewCell.swift
//  PANELNOW
//
//  Created by 홍준범 on 11/20/25.
//

import UIKit

class BaseUITableViewCell: UITableViewCell {
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUP()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUP() {
        setStyle()
        setUI()
        setLayout()
    }
    
    // MARK: - Override Points
    
    func setStyle() { }
    
    func setUI() { }
    
    func setLayout() { }
}
