//  ___FILEHEADER___

import UIKit

protocol ___VARIABLE_productName___RouterProtocol: Router {
}

class ___VARIABLE_productName___Router: ___VARIABLE_productName___RouterProtocol {
    weak var viewController: ___VARIABLE_productName___ViewController!
    weak var delegate: ___VARIABLE_productName___Delegate?

    init(viewController: ___VARIABLE_productName___ViewController, delegate: ___VARIABLE_productName___Delegate) {
        self.viewController = viewController
        self.delegate = delegate
    }
}
