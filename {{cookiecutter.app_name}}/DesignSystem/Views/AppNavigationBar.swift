//
//  AppNavigationBar.swift
//  DesignSystem
//
//  Created by pgorzelany on 10/12/2019.
//  Copyright © 2019 {{cookiecutter.company_name}}. All rights reserved.
//

import UIKit

/**
UINavigationBar control styled for  Design System.

In order to use this control in XIB/Storyboard:
1. Open Interface Builder.
2. Add `UINavigationController` control to your view controller hierarchy.
3. Open Navigation Bar inside the Navigation Controller in the Document Outline.
4. Open Identity Inspector (View -> Inspectors -> Show Identity Inspector).
5. In Custom Class section change Class property to `AppNavigationBar`, Module property should change automatically to `DesignSystem`.

- Note: Make sure you edit class for Navigation Bar and not Navigation Controller.
- Note: Styled navigation bar will not be visible in Interface Builder, but only in runtime.
*/
open class AppNavigationBar: UINavigationBar {
}
