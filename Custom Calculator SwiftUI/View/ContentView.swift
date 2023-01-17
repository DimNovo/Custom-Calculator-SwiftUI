//
//  ContentView.swift
//  Custom Calculator SwiftUI
//
//  Created by Dmitry Novosyolov on 17/01/2023.
//

import SwiftUI

struct ContentView: View {
    /// The current calculation result, if any
    @State
    private var result: String? = nil
    /// The current input data as an array of strings
    @State
    private var inputData: [String] = []
    /// Whether the undo button is currently enabled
    @State
    private var undoPermission: Bool = false
    /// Whether the calculate button is currently enabled
    @State
    private var calculatePermission: Bool = false
    /// The currently selected CalcItem
    @State
    private var selectedCalcItem: CalcItem? = nil
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(inputData.joined())
                    .font(.custom(.font, size: 42))
                    .tracking(3)
                    .lineLimit(5)
                    .padding()
                if let result {
                    VStack {
                        Text(result)
                            .font(.custom(.font, size: 34))
                            .foregroundColor(.green)
                            .padding()
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 250, alignment: .bottom)
            .background {
                RoundedRectangle(cornerRadius: 18)
                    .fill(.bar)
            }
            .padding(.top)
//            .shadow(color: .blue.opacity(0.15), radius: 3, x: .zero, y: 3)
            Spacer()
        }
        .overlay(alignment: .bottom) {
            CalculatorKeyboardView(
                undoPermission: $undoPermission,
                calculatePermission: $calculatePermission,
                selectedCalcItem: $selectedCalcItem
            )
        }
        .padding(.horizontal)
        .background(.thickMaterial)
        .onChange(of: selectedCalcItem) { newItem in
            guard let newItem else { return }
            switch newItem {
            case .undo:
                inputData.removeLast()
            case .reset:
                result = nil
                inputData.removeAll()
            case .calculate:
                result = inputData.prepareForExpression.evaluateExpression()
                inputData.removeAll()
            default:
                let parsed = newItem.raw.replacingOccurrences(of: "–", with: "-")
                inputData.append(parsed)
            }
            selectedCalcItem = nil
        }
        .onChange(of: inputData.count) { newCount in
            undoPermission = newCount > 1
            calculatePermission = newCount >= 3
            result = newCount > 0 ? nil : result
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
