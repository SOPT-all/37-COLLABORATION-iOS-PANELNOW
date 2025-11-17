//
//  UIStackView+.swift
//  PANELNOW
//
//  Created by 신혜연 on 11/17/25.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
