//
//  Bundle+Extension.swift
//  DesignSystem
//
//  Copyright © 2019 Objectivity. All rights reserved.
//

import Foundation

private class DesignSystem { }

/// Bundle extensions used by Design System.
extension Bundle {
    /// Bundle containing Design System resources.
    public static var designSystem: Bundle {
        return Bundle(for: type(of: DesignSystem()))
    }
}
