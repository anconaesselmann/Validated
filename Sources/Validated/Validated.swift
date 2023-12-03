//  Created by Axel Ancona Esselmann on 11/14/23.
//

import Foundation

@propertyWrapper
public class Validated<T, R>: ObservableObject {

    @Published
    var value: ValidationResult<T, R>

    public var wrappedValue: ValidationResult<T, R> {
        get {
            value
        }
        set {
            switch newValue {
            case .raw(let raw):
                if let validator = validator {
                    value = validator.validate(raw)
                }
            case .none, .valid, .validEmpty, .error:
                value = newValue
            }
        }
    }

    public var validator: (any Validator<T, R>)? {
        didSet {
            switch value {
            case .raw(let raw):
                if let validator = validator {
                    value = validator.validate(raw)
                }
            case .none, .valid, .validEmpty, .error: ()
            }
        }
    }

    public init(wrappedValue: ValidationResult<T, R>, validator: (any Validator<T, R>)? = nil) {
        self.validator = validator
        self.value = wrappedValue
    }
}
