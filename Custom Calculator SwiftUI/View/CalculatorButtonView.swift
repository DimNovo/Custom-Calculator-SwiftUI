//
//  CalculatorButtonView.swift
//  Custom Calculator SwiftUI
//
//  Created by Dmitry Novosyolov on 17/01/2023.
//

import SwiftUI

struct CalculatorButtonView: View {
    /// The currently selected CalcItem
    @Binding
    var selectedCalcItem: CalcItem?
    let calcItem: CalcItem
    var body: some View {
        Button {
            selectedCalcItem = calcItem
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .fill(calcItem.gradient)
                .scaledToFit()
                .overlay {
                    Text(calcItem.raw)
                        .font(.custom(.font, size: 44))
//                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
        }
        .buttonStyle(.borderless)
    }
}

struct CalculatorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonView(selectedCalcItem: .constant(nil), calcItem: CalcItem.allCases[0])
    }
}
