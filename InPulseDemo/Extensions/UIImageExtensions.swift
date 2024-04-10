//
//  UIImageExtensions.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import Foundation
import UIKit

extension UIImage {

    class func colorForNavBar(color: UIColor) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 1.0, height: 1.0))

        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        context?.setShadow(offset: CGSize(width: 0, height: -4), blur: 5, color: color.withAlphaComponent(0.15).cgColor)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image!
    }
}
