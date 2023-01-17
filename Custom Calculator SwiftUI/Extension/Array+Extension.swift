//
//  Array+Extension.swift
//  Custom Calculator SwiftUI
//
//  Created by Dmitry Novosyolov on 17/01/2023.
//

import Foundation

extension Array where Element == CalcItem {
    /// Returns an array containing only elements that are either of the value ".fraction" or ".undo", or elements that can be converted to an Int.
    var numbersAndUndo: Self {
        filter { ($0 != .reset && $0 == .fraction || $0 == .undo) || Int($0.raw) != nil }
    }
    
    /// Returns an array containing only elements that are not equal to ".reset", ".fraction", ".calculate" and ".undo" and elements that can't be converted to an Int.
    var operands: Self {
        filter { $0 != .reset && $0 != .fraction && $0 != .calculate && $0 != .undo && Int($0.raw) == nil }
    }
    
    /// Returns an array containing only elements that are equal to ".reset" or ".calculate".
    var resetAndCalculate: Self {
        filter { $0 == .reset || $0 == .calculate }
    }
}

extension Array where Element == String {
    /// Returns a string by converting any single digit integers in the array to double and joining the array.
    var prepareForExpression: Element {
        var temp: Self = self
        for index in temp.indices {
            if count > 3 {
                if index < (count - 1), index > 0,
                   String.descrNumber.contains(temp[index]),
                   !String.descrNumber.contains(temp[index + 1]) {
                    if !String.descrNumber.contains(temp[index - 1]),
                       let number = Int(temp[index]) {
                        temp[index] = String(Double(number))
                    }
                }
            } else if let number = Int(temp[index]) {
                temp[index] = String(Double(number))
            }
        }
        return temp.joined()
    }
}
