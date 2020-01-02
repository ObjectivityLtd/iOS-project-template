//
//  NibInstantiableView.swift
//  DesignSystem
//
//  Copyright © 2018 Objectivity. All rights reserved.
//

import UIKit

/// Base class for custom views loaded from XIB files.
open class NibInstantiableView: UIView {

    /// Name of the XIB file. Default implentation uses class name.
    open var nibName: String {
        return String(describing: type(of: self))
    }

    /// Required initializer for XIB/Storyboard usage.
    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        loadFromNib()
        configureView()
    }

    /// Initializer for programmatic view creation.
    public override init(frame: CGRect) {
        super.init(frame: frame)

        loadFromNib()
        configureView()
    }

    /// Instantiate view from XIB file.
    open func loadFromNib() {
        let type = Swift.type(of: self)
        let bundle = Bundle(for: type.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        guard let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Unable to load view from '\(nibName).xib file.")
        }

        addSubviewConstrainedToEdges(nibView)
    }

    /**
     Subclasses should implement this method to configure subviews after the view outlets are connected.

     This method is called during control initialization, after view is loaded from XIB.
     */
    open func configureView() { }
}
