//
//  String.swift
//  FlowApp
//
//

import Foundation

public extension String {
    var isNumber: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }

    var isAlphanumeric: Bool {
        !containsSpecialCharacters
    }

    var isEnglishOrSpecialCharacter: Bool {
        var allowed = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        allowed.insert(charactersIn: "!@$%^&(_-=)*#")
        return rangeOfCharacter(from: allowed.inverted) == nil && self != ""
    }

    var containsNumber: Bool {
        rangeOfCharacter(from: .decimalDigits) != nil
    }

    var containsCapital: Bool {
        contains { char in
            char.isUppercase
        }
    }

    var containsWhitespace: Bool {
        contains { char in
            char.isWhitespace
        }
    }

    subscript (range: Range<Int>) -> String {
        let updatedRange = Range(uncheckedBounds: (lower: max(0, min(count, range.lowerBound)),
                                            upper: min(count, max(0, range.upperBound))))
        let start = index(startIndex, offsetBy: updatedRange.lowerBound)
        let end = index(start, offsetBy: updatedRange.upperBound - updatedRange.lowerBound)
        return String(self[start ..< end])
    }

    func substring(fromIndex: Int) -> String {
        self[min(fromIndex, count) ..< count]
    }

    func substring(toIndex: Int) -> String {
        self[0 ..< max(0, toIndex)]
    }

    
    
}

public extension String {
    /// Used remove groupingSelector and auto appended .00 at the end of UITextField text when we beginEditing
 
    var containsSpecialCharacters: Bool {
        let regex = ".*[^A-Za-z0-9,. \\p{Arabic}].*"
        let testString = NSPredicate(format: "SELF MATCHES %@", regex)
        return testString.evaluate(with: self)
    }

    var containsDecimalNumbers: Bool {
        let allowedCharacters = CharacterSet(charactersIn: "0123456789.")
        return CharacterSet(charactersIn: self).isSubset(of: allowedCharacters)
    }

    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
