//  ___FILEHEADER___

import RxCocoa
import RxSwift
import UIKit

class ___VARIABLE_productName___ViewController: UIViewController {

    // MARK: Outlets

    // MARK: Private Properties

    private let disposeBag = DisposeBag()

    // MARK: Public Properties

    var viewModel: ___VARIABLE_productName___ViewModelProtocol!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
        setupBindings()

        viewModel.viewDidLoad()
    }

    // MARK: Configuration

    func configure(with viewModel: ___VARIABLE_productName___ViewModelProtocol) {
        self.viewModel = viewModel
    }

    private func configureViews() {

    }

    private func setupBindings() {

    }

    // MARK: Others
}
