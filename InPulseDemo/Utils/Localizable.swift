//
//  Localizable.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import UIKit

// MARK: Localizable
public protocol Localizable {
    var localized: String { get }
    var privateLocalized: String { get }
}

extension String: Localizable {
    public var localized: String {
        return NSLocalizedString(self, tableName: "Localizable", comment: "")
    }

    public var privateLocalized: String {
        return NSLocalizedString(self, comment: "")
    }
}

// MARK: XIBLocalizable
public protocol XIBLocalizable {
    var xibLocKey: String? { get set }
    var xibPrivateLocKey: String? { get set }
}

extension UILabel: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }

    @IBInspectable public var xibPrivateLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.privateLocalized
        }
    }
}

extension UIButton: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get { return nil }
        set(key) {
            setTitle(key?.localized, for: .normal)
        }
    }

    @IBInspectable public var xibPrivateLocKey: String? {
        get { return nil }
        set(key) {
            setTitle(key?.privateLocalized, for: .normal)
        }
    }
}

extension UINavigationItem: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get { return nil }
        set(key) {
            title = key?.localized
        }
    }

    @IBInspectable public var xibPrivateLocKey: String? {
        get { return nil }
        set(key) {
            title = key?.privateLocalized
        }
    }
}

extension UIBarItem: XIBLocalizable { // Localizes UIBarButtonItem and UITabBarItem
    @IBInspectable public var xibLocKey: String? {
        get { return nil }
        set(key) {
            title = key?.localized
        }
    }

    @IBInspectable public var xibPrivateLocKey: String? {
        get { return nil }
        set(key) {
            title = key?.privateLocalized
        }
    }
}

// MARK: Special protocol to localize multiple texts in the same control
public protocol XIBMultiLocalizable {
    var xibLocKeys: String? { get set }
    var xibPrivateLocKey: String? { get set }
}

extension UISegmentedControl: XIBMultiLocalizable {
    @IBInspectable public var xibLocKeys: String? {
        get { return nil }
        set(keys) {
            guard let keys = keys?.components(separatedBy: ","), !keys.isEmpty else { return }
            for (index, title) in keys.enumerated() {
                setTitle(title.localized, forSegmentAt: index)
            }
        }
    }

    @IBInspectable public var xibPrivateLocKey: String? {
        get { return nil }
        set(keys) {
            guard let keys = keys?.components(separatedBy: ","), !keys.isEmpty else { return }
            for (index, title) in keys.enumerated() {
                setTitle(title.privateLocalized, forSegmentAt: index)
            }
        }
    }
}

// MARK: Special protocol to localizaze UITextField's placeholder
public protocol UITextFieldXIBLocalizable {
    var xibPlaceholderLocKey: String? { get set }
    var xibPrivatePlaceholderLocKey: String? { get set }
}

extension UITextField: UITextFieldXIBLocalizable {
    @IBInspectable public var xibPlaceholderLocKey: String? {
        get { return nil }
        set(key) {
            placeholder = key?.localized
        }
    }

    @IBInspectable public var xibPrivatePlaceholderLocKey: String? {
        get { return nil }
        set(key) {
            placeholder = key?.privateLocalized
        }
    }
}
