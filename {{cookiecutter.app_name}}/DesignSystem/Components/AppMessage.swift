//
//  AppMessage.swift
//  DesignSystem
//

import SwiftMessages

/**
 Component for displaying application messages. Message views appears for a show while from the top of the screen, and then disappers.

 The are four message styles: success, info, warning and error.

 In order to use this component programmatically, use following code:

		AppMessage.showMessage("Message Body", title: "Title", style: .success)

 */
public enum AppMessage {

    /// AppMessage specific styles, which influence colors and icons of the message views.
    public enum Style {
        /// Style representing success message: white text on green background.
        case success

        /// Style representing info message: white text on blue background.
        case info

        /// Style representing warning message: white text on yellow background.
        case warning

        /// Style representing error message: white text on red background.
        case error
    }

    // MARK: Methods

    /**
     Show message on the top of the screen.

     - Parameter body: body of the message.
     - Parameter title: title of the message (optional).
     - Parameter style: style of the message.
     */
    public static func showMessage(_ body: String, title: String?, style: Style) {
        let messageView = MessageView.viewFromNib(layout: .cardView)
        messageView.applyStyle(style)
        messageView.button?.isHidden = true

        messageView.titleLabel?.font = AppFont.font(size: .regular, weight: .bold)
        messageView.titleLabel?.text = title
        messageView.titleLabel?.isHidden = title == nil

        messageView.bodyLabel?.font = AppFont.font(size: .regular, weight: .regular)
        messageView.bodyLabel?.text = body

        var config = SwiftMessages.Config()
        config.ignoreDuplicates = false
        config.duration = .seconds(seconds: 5.0)
        SwiftMessages.show(config: config, view: messageView)
    }
}

extension MessageView {
    fileprivate func applyStyle(_ style: AppMessage.Style) {
        switch style {
        case .success:
            configureTheme(backgroundColor: AppColor.turquoise1, foregroundColor: AppColor.white, iconImage: nil)
            applyShadow(for: AppColor.turquoise4)
        case .info:
            configureTheme(backgroundColor: AppColor.blue3, foregroundColor: AppColor.white, iconImage: nil)
            applyShadow(for: AppColor.blue4)
        case .warning:
            configureTheme(backgroundColor: AppColor.orange1, foregroundColor: AppColor.white, iconImage: nil)
            applyShadow(for: AppColor.orange4)
        case .error:
            configureTheme(backgroundColor: AppColor.red, foregroundColor: AppColor.white, iconImage: nil)
            applyShadow(for: AppColor.sand4)
        }
    }

    private func applyShadow(for color: UIColor) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layoutSubviews()
    }
}
