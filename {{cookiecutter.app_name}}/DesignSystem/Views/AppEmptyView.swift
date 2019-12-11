//
//  AppEmptyView.swift
//  DesignSystem
//
//  Created by pgorzelany on 10/12/2019.
//  Copyright © 2019 AwesomeCompany. All rights reserved.
//

import UIKit

/**
Empty view as a custom view used to provide user feedback on screens with lists of items (table view, collection view, etc) when
no data is available.

This view provides only the UI for empty state, your code is responsible for showing/hiding this control, depending on availability
of data in the list of items.

Usually you should set at least:
* icon image
* title text

Optionally you can also set:
* descritpion text

In order to use this controller programmatically (suggested approach):

       let emptyView = AppEmptyView(frame: .zero)
       emptyView.iconImage = UIImage(named: "icon")
       emptyView.titleText = "No data"

       tableView.backgroundView = emptyView
       tableView.backgroundView.isHidden = ... // Hide if there are no items.

*/
open class AppEmptyView: NibInstantiableView {

    /// Icon image for confirmation view.
    @IBInspectable public var iconImage: UIImage? {
        get {
            return iconImageView.image
        }
        set {
            iconImageView.image = newValue
            iconImageView.isHidden = newValue == nil
        }
    }

    /// Title text for confirmation view.
    @IBInspectable public var titleText: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
            titleLabel.isHidden = newValue == nil
        }
    }

    /// Description text for confirmation view.
    @IBInspectable public var descriptionText: String? {
        get {
            return descriptionLabel.text
        }
        set {
            descriptionLabel.text = newValue
            descriptionLabel.isHidden = newValue == nil
        }
    }

    // MARK: Outlets

    /// Icon image view used by the empty view.
    @IBOutlet public weak var iconImageView: UIImageView!

    /// Title label used by the empty view.
    @IBOutlet public weak var titleLabel: AppLabel!

    /// Description label used by the empty view.
    @IBOutlet public weak var descriptionLabel: AppLabel!

    // MARK: Lifecycle

    /// :nodoc:
    open override func configureView() {
        titleLabel.font = AppFont.font(size: .huge, weight: .medium)
        titleLabel.textColor = AppColor.textHeader
        descriptionLabel.font = AppFont.font(size: .medium, weight: .medium)
        titleText = nil
        descriptionText = nil
    }

}
