//  ___FILEHEADER___

import Foundation
import RxCocoa
import RxSwift

protocol ___VARIABLE_productName___ViewModelProtocol {
    // MARK: Input events
    func viewDidLoad()

    // MARK: Input properties

    // MARK: Output properties
    var example: Driver<String> { get }
}

class ___VARIABLE_productName___ViewModel: ___VARIABLE_productName___ViewModelProtocol {

    // MARK: Private Properties

    private let router: ___VARIABLE_productName___RouterProtocol

    private let exampleRelay = BehaviorRelay(value: "Hi!")
    private let disposeBag = DisposeBag()

    // MARK: Input properties

    // MARK: Output properties

    let example: Driver<String>

    // MARK: Lifecycle

    init(router: ___VARIABLE_productName___RouterProtocol) {
        self.router = router
        self.example = exampleRelay.asDriver()
    }

    // MARK: Input events
    func viewDidLoad() {
    }
}
