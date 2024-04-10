//
//  BaseView.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import UIKit

class BaseView: UIView {

    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    private let screenHeight: CGFloat = UIScreen.main.bounds.height

    // MARK: view used for init from nib
    private var contentView: UIView!

    // -------------------------------------------------------------------------------------------------------
    // MARK: - Init -
    // -------------------------------------------------------------------------------------------------------
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        xibSetup()

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        xibSetup()
    }

    deinit {
        print("\(Date()): ✅ \(String(describing: self)) deinit!")
    }

    // -------------------------------------------------------------------------------------------------------
    // MARK: - Show on super view -
    // -------------------------------------------------------------------------------------------------------
    func addToWindow() {
        let keyWindow = UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .last { $0.isKeyWindow }

        keyWindow?.addSubview(self)
    }

    // -------------------------------------------------------------------------------------------------------
    // MARK: - Setup Xib -
    // -------------------------------------------------------------------------------------------------------

    private func xibSetup() {
        contentView = loadViewFromNib()
        contentView.backgroundColor = UIColor.clear

        addSubview(contentView)

        // Adding custom subview on top of our view (over any custom drawing > see note below)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false

        // Set contraints to full view
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: self.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
    }

    internal func getNibName() -> String {
        return ""
    }

    private func loadViewFromNib() -> UIView {
        var name = getNibName()
        if name.isEmpty {
            name = String(describing: type(of: self))
        }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: name, bundle: bundle)

        // Assumes UIView is top level and only object in CustomView.xib file
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view ?? UIView()
    }
}

