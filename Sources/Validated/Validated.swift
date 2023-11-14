//  Created by Axel Ancona Esselmann on 11/14/23.
//

import Foundation

@propertyWrapper
public struct Validated<T, R> {

    public var wrappedValue: ValidationResult<T, R> {
        didSet {
            switch wrappedValue {
            case .raw(let raw):
                wrappedValue = validator.validate(raw)
            case .none, .valid, .validEmpty, .error: ()
            }
        }
    }

    private var validator: (any Validator<T, R>)

    public init(wrappedValue: ValidationResult<T, R>, validator: any Validator<T, R>) {
        self.validator = validator
        self.wrappedValue = wrappedValue
    }
}
