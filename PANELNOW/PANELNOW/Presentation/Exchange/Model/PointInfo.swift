//
//  PointInfo.swift
//  PANELNOW
//
//  Created by 박정환 on 11/21/25.
//

struct PointInfo {
    let current: Int
    let exchanged: Int
}

extension PointInfo {
    init(dto: PointData) {
        self.current = dto.currentPoint
        self.exchanged = dto.usedPoint
    }
}
