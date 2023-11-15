//  Created by Axel Ancona Esselmann on 11/14/23.
//

import Foundation

public struct DoubleValidator: Validator {

    public var allowNil: Bool

    public init(allowNil: Bool = true) {
        self.allowNil = allowNil
    }

    public enum Error: Swift.Error, LocalizedError {
        case noValue, notANumber(String)

        public var errorDescription: String? {
            switch self {
            case .noValue:
                return "Empty value"
            case .notANumber(let value):
                return "\(value) is not a number"
            }
        }
    }

    public func validate(_ rawValue: String) -> ValidationResult<Double, String> {
        guard !rawValue.isEmpty else {
            if allowNil {
                return .validEmpty
            } else {
                return .error(Error.noValue)
            }
        }
        guard let value = Double(rawValue) else {
            return .error(Error.notANumber(rawValue))
        }
        return .valid(value)
    }
}
