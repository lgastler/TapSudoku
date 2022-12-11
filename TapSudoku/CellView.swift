//
//  CellView.swift
//  TapSudoku
//
//  Created by Lennart Gastler on 11.12.22.
//

import SwiftUI

struct CellView: View {
    
    enum HighlightState {
        case standard, hightlighted, selected
        
        var color: Color {
            switch self {
            case .standard:
                return .squareStandard
            case .hightlighted:
                return .squareHighlighted
            case .selected:
                return .squareSelected
            }
        }
    }
    
    let number: Int
    let selectedNumber: Int
    let hightlightState: HighlightState
    let isCorrect: Bool
    var onSelected: () -> Void
    
    var displayNumber: String {
        if number == 0 {
            return ""
        } else {
            return String(number)
        }
    }
    
    var foregroundColor: Color {
        if isCorrect {
            if number == selectedNumber {
                return .squareTextSame
            } else {
                return .squareTextCorrect
            }
        } else {
            return .squareTextWrong
        }
    }
    
    var body: some View {
        Button(action: onSelected) {
            Text(displayNumber)
                .font(.title)
                .foregroundColor(foregroundColor)
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .background(hightlightState.color)
        }
        .buttonStyle(.plain)
        .accessibilityShowsLargeContentViewer()
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(number: 1, selectedNumber: 2, hightlightState: .standard, isCorrect: true) {}
    }
}
