//  Created by Axel Ancona Esselmann on 11/14/23.
//

import Foundation

public protocol Validator<T, R> {

    associatedtype T
    associatedtype R

    func validate(_ value: R) -> ValidationResult<T, R>
}
