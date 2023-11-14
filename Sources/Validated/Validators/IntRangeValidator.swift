//  Created by Axel Ancona Esselmann on 11/14/23.
//

import Foundation

public struct IntRangeValidator: Validator {

    private let from: Int, to: Int

    public init(from: Int, to: Int) {
        self.from = from
        self.to = to
    }

    public enum Error: Swift.Error, LocalizedError {
        case belowRange, aboveRange, noValue, notANumber(String)

        public var errorDescription: String? {
            switch self {
            case .belowRange:
                return "Below range"
            case .aboveRange:
                return "Above range"
            case .noValue:
                return "Empty value"
            case .notANumber(let value):
                return "\(value) is not a number"
            }
        }
    }

    public func validate(_ rawValue: String) -> ValidationResult<Int, String> {
        guard !rawValue.isEmpty else {
            return .error(Error.noValue)
        }
        guard let value = Int(rawValue) else {
            return .error(Error.notANumber(rawValue))
        }
        switch value {
        case Int.min...from:
            return .error(Error.belowRange)
        case to...Int.max:
            return .error(Error.aboveRange)
        default: return .valid(value)
        }
    }
}
