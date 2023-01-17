//
//  String+Extension.swift
//  Custom Calculator SwiftUI
//
//  Created by Dmitry Novosyolov on 17/01/2023.
//

import Foundation

extension String {
    /// A static variable that contains all the characters that are considered as numbers in the evaluateExpression function.
    static var descrNumber: Self {
        "0987654321."
    }
    
    /// Evaluates the mathematical expression represented by the string and returns the result as a string.
    /// If the expression is invalid, it returns an error message.
    func evaluateExpression() -> Self {
        let expression: NSExpression = .init(format: self)
        if let value = expression.expressionValue(with: nil, context: nil) as? Double {
            return NumberFormatter.localizedString(from: NSNumber(value: value), number: .decimal)
        } else {
            return "Error:\nInvalid Expression."
        }
    }
    /// Custom font extension
    static var font: Self {
        "break"
    }
}
