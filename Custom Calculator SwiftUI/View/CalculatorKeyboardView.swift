//
//  CalculatorKeyboardView.swift
//  Custom Calculator SwiftUI
//
//  Created by Dmitry Novosyolov on 17/01/2023.
//

import SwiftUI

struct CalculatorKeyboardView: View {
    /// Whether the undo button is currently enabled
    @Binding
    var undoPermission: Bool
    /// Whether the calculate button is currently enabled
    @Binding
    var calculatePermission: Bool
    /// The currently selected CalcItem
    @Binding
    var selectedCalcItem: CalcItem?
    /// The array containing all the calculator items, which is created by combining three other arrays: numbersAndUndo, operands and resetAndCalculate.
    private let calcData: [CalcItem] = CalcItem.allCases.numbersAndUndo + CalcItem.allCases.operands + CalcItem.allCases.resetAndCalculate
    var body: some View {
        LazyVGrid(columns: .init(repeating: .init(), count: 4)) {
            ForEach(calcData) {
                CalculatorButtonView(selectedCalcItem: $selectedCalcItem, calcItem: $0)
                    .disabled(($0 == .undo && !undoPermission) || ($0 == .calculate && !calculatePermission))
                    .opacity(($0 == .undo && !undoPermission) || ($0 == .calculate && !calculatePermission) ? 0.35 : 1.0)
            }
        }
    }
}


struct CalculatorKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorKeyboardView(
            undoPermission: .constant(false),
            calculatePermission: .constant(false),
            selectedCalcItem: .constant(nil)
        )
    }
}
