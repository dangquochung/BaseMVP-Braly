//
//  RSwiftExtensions.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import SwiftUI
import RswiftResources

extension FontResource {
    func font(size: CGFloat) -> Font {
        Font.custom(name, size: size)
    }
}
