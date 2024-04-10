//
//  StringExtensions.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import Foundation
import UIKit

extension String {
    var pathExtension: String? {
        let cleaned = replacingOccurrences(of: " ", with: "_")
        let ext = URL(string: cleaned)?.pathExtension
        return ext == "" ? nil : ext
    }
    
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
