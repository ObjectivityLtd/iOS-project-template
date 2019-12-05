//
//  UIView+Extensions.swift
//  DesignSystem
//
//  Copyright © 2018 Objectivity. All rights reserved.
//

import UIKit

/// UIView extensions used by DesignSystem
extension UIView {

    /**
     Apply shadow for given view.

     - Parameter color: shadow color (`AppColor.shadow` by default)
     - Parameter radius: shadow radius (`4.0` by default)
     - Parameter offset: shadow offset (`4.0` vertical offset by default)
     - Parameter opacity: shadow opacity (`0.3` by default)
    */
    public func applyShadow(color: UIColor = AppColor.shadow,
                            radius: CGFloat = 4.0,
                            offset: CGSize = CGSize(width: 0.0, height: 4.0),
                            opacity: Float = 0.3) {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }

    /// Clears shadow added by using `applyShadow`.
    public func clearShadow() {
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowRadius = 0.0
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.0
    }

    /**
     Adds a given subview as a child of the view and adds layout constraints that pin the subview to the edge of the view.

     - Parameter subview: subview to add.
     */
    public func addSubviewConstrainedToEdges(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }

    /**
     Apply circular border to the view, by setting proper `cornerRadius` property on view's `layer`.

     Note: view should be equal `width` and `height` for this method to work correctly.
     */
    public func applyCircularBorder() {
        layer.cornerRadius = frame.size.height / 2.0
    }
}
