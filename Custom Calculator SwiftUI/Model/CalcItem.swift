//
//  CalcItem.swift
//  Custom Calculator SwiftUI
//
//  Created by Dmitry Novosyolov on 17/01/2023.
//

import SwiftUI

enum CalcItem: Identifiable, CaseIterable {
    /// A unique identifier for each case of the CalcItem enum
    var id: String { "\(self)" }
    case _1, _2, _3, _4, _5, _6, _7, _8, _9, _0
    case fold
    case substract
    case divide
    case multiply
    case reset
    case undo
    case fraction
    case bracketLeft
    case bracketRight
    case calculate
    /// A string representation of each case of the CalcItem enum
    var raw: String {
        switch self {
        case ._1, ._2, ._3, ._4, ._5, ._6, ._7, ._8, ._9, ._0:
            return String(id.dropFirst())
        case .fold:
            return "+"
        case .substract:
            return "–"
        case .divide:
            return "/"
        case .multiply:
            return "*"
        case .reset:
            return "C"
        case .undo:
            return "↩︎"
        case .fraction:
            return "."
        case .bracketLeft:
            return "("
        case .bracketRight:
            return ")"
        case .calculate:
            return "="
        }
    }
    /// A gradient representation of each case of the CalcItem enum
    var gradient: AnyGradient {
        switch self {
        case ._1, ._2, ._3, ._4, ._5, ._6, ._7, ._8, ._9, ._0, .fraction:
            return Color.blue.gradient
        case .fold, .substract, .divide, .multiply, .bracketLeft, .bracketRight:
            return Color.orange.gradient
        case .reset:
            return Color.red.gradient
        case .undo:
            return Color.gray.gradient
        case .calculate:
            return Color.green.gradient
        }
    }
}
