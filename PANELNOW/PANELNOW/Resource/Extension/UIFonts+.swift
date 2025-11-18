//
//  UIFonts+.swift
//  PANELNOW
//
//  Created by 홍준범 on 11/18/25.
//

import UIKit

extension UIFont {
    enum PretendardFont {
        case title_bd_24
        case title_sb_20
        case title_sb_16
        case title_m_14
        case title_m_12
        case body_r_16
        case body_r_14
        case body_m_12
        case body_m_10
    }
    
    static func pretendard(_ style: PretendardFont) -> UIFont {
        switch style {
        case .title_bd_24:
            return UIFont(name: "Pretendard-Bold", size: 24) ?? .systemFont(ofSize: 24, weight: .bold)
        case .title_sb_20:
            return UIFont(name: "Pretendard-SemiBold", size: 20) ?? .systemFont(ofSize: 20, weight: .semibold)
        case .title_sb_16:
            return UIFont(name: "Pretendard-SemiBold", size: 16) ?? .systemFont(ofSize: 16, weight: .semibold)
        case .title_m_14:
            return UIFont(name: "Pretendard-Medium", size: 14) ?? .systemFont(ofSize: 14, weight: .medium)
        case .title_m_12:
            return UIFont(name: "Pretendard-Medium", size: 12) ?? .systemFont(ofSize: 12, weight: .medium)
        case .body_r_16:
            return UIFont(name: "Pretendard-Regular", size: 16) ?? .systemFont(ofSize: 16, weight: .regular)
        case .body_r_14:
            return UIFont(name: "Pretendard-Regular", size: 14) ?? .systemFont(ofSize: 14, weight: .regular)
        case .body_m_12:
            return UIFont(name: "Pretendard-Medium", size: 12) ?? .systemFont(ofSize: 12, weight: .medium)
        case .body_m_10:
            return UIFont(name: "Pretendard-Medium", size: 10) ?? .systemFont(ofSize: 10, weight: .medium)
        }
    }
}
