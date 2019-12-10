//
//  AppFont.swift
//  DesignSystem
//

import CoreGraphics
import UIKit

/// Font definitions for Design System.
public enum AppFont {

    /// Font sizes used in Design System.
    public enum Size {
        /// Tiny font size: 9 pt.
        case tiny

        /// Small font size: 11 pt.
        case small

        /// Regular font size: 15 pt.
        case regular

        /// Medium font size: 18 pt.
        case medium

        /// Large font size: 23 pt.
        case large

        /// Huge font size: 32 pt.
        case huge

        /// Custom font size (in points).
        case custom(_: CGFloat)

        /// Font size in points for given size enum value.
        var fontSize: CGFloat {
            switch self {
            case .tiny:
                return 9.0
            case .small:
                return 11.0
            case .regular:
                return 15.0
            case .medium:
                return 18.0
            case .large:
                return 23.0
            case .huge:
                return 32.0
            case .custom(let size):
                return size
            }
        }
    }

    /// Font weights used in Design System.
    public enum Weight: String, CaseIterable {
        /// Thin weight (100 units)
        case thin

        /// Extra Light weight (200 units)
        case extraLight

        /// Light weight (300 units)
        case light

        /// Regular weight (400 units)
        case regular

        /// Medium weight (500 units)
        case medium

        /// Semi-Bold weight (600 units)
        case semiBold

        /// Bold weight (700 units)
        case bold

        /// Extra-Bold weight (800 units)
        case extraBold

        /// Black weight (900 units)
        case black
    }

    /// Design System font for given size and weight parameters.
    public static func font(size: Size, weight: Weight) -> UIFont {
        // Ensure fonts are registered.
        _ = registerCustomFonts

        let name = fontName(for: weight)
        guard let font = UIFont(name: name, size: size.fontSize) else {
            fatalError("Unabled to load font \(String(describing: fontName))")
        }

        return font
    }

    public static let regularText = font(size: .regular, weight: .regular)

    static let fontFamily = "Montserrat"

    private static func fontName(for weight: Weight) -> String {
        return "\(fontFamily)-\(weight.rawValue.uppercasedFirstCharacter())"
    }

    /// Based on https://stackoverflow.com/a/49828127
    /// This is needed because the fonts are not in the main target but in a framework
    /// A static property is used to make sure the registration is done only once
    private static var registerCustomFonts: Void = {
        for weight in Weight.allCases {
            registerFont(name: fontName(for: weight))
        }
    }()

    private static func registerFont(name: String) {
        guard let fontUrl = Bundle.designSystem.url(forResource: name, withExtension: "ttf"),
            let fontData = NSData(contentsOf: fontUrl),
            let dataProvider = CGDataProvider(data: fontData),
            let fontRef = CGFont(dataProvider)
            else {
                print("Failed to register font - bundle identifier invalid.")
                return
            }

        var errorRef: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) {
            print("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }
    }
}

extension String {
    fileprivate func uppercasedFirstCharacter() -> String {
        guard count >= 1 else { return self }
        return replacingCharacters(in: ...startIndex, with: String(self[startIndex]).uppercased())
    }
}
