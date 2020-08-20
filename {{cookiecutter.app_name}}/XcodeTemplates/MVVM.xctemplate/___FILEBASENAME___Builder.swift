//  ___FILEHEADER___

import UIKit

class ___VARIABLE_productName___Builder {

    func createModule(delegate: ___VARIABLE_productName___Delegate) -> ___VARIABLE_productName___ViewController {
        let viewController = ___VARIABLE_productName___ViewController(nibName: R.nib.___VARIABLE_productName___ViewController.name, bundle: nil)
        let viewModel = ___VARIABLE_productName___ViewModel(
            router: ___VARIABLE_productName___Router(viewController: viewController, delegate: delegate)
        )

        viewController.configure(with: viewModel)
        return viewController
    }
}
