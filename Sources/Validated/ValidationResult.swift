//  Created by Axel Ancona Esselmann on 11/14/23.
//

import Foundation

public enum ValidationState {
    case notValidated, valid, invalid
}

public enum ValidationResult<Value, Raw> {
    case none
    case raw(Raw)
    case valid(Value)
    case validEmpty
    case error(Error)

    public var value: Value? {
        switch self {
        case .valid(let value): return value
        default: return nil
        }
    }

    public var isValid: Bool {
        switch self {
        case .valid, .validEmpty: return true
        default: return false
        }
    }

    public var isInvalid: Bool {
        switch self {
        case .error: return true
        default: return false
        }
    }

    public var isValidated: Bool {
        switch state {
        case .invalid, .valid: return true
        case .notValidated: return false
        }
    }

    public var state: ValidationState {
        switch self {
        case .none, .raw:
            return .notValidated
        case .valid, .validEmpty:
            return .valid
        case .error:
            return .invalid
        }
    }

    public var error: Error? {
        switch self {
        case .error(let error): return error
        default: return nil
        }
    }
}
