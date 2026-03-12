//
//  DiceView.swift
//  diceRoller
//
//  Created by Fai on 11/03/26.
//

import SwiftUI

struct DiceView: View {
    let value: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.red)
                .frame(width: 120, height: 120)
                .shadow(radius: 4)
            
            VStack(spacing: 12) {
                if value == 1 { pip }
                else if value == 2 { pipGrid([true, false, false, false, false, false, false, false, true]) }
                else if value == 3 { pipGrid([true, false, false, false, true, false, false, false, true]) }
                else if value == 4 { pipGrid([true, false, true, false, false, false, true, false, true]) }
                else if value == 5 { pipGrid([true, false, true, false, true, false, true, false, true]) }
                else if value == 6 { pipGrid([true, false, true, true, false, true, true, false, true]) }
            }
            .frame(width: 80, height: 80)
        }
    }
    
    var pip: some View {
        Circle().fill(Color.black).frame(width: 20, height: 20)
    }
    
    func pipGrid(_ mask: [Bool]) -> some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10) {
            ForEach(0..<9) { i in
                if mask[i] { pip } else { Spacer().frame(width: 20, height: 20) }
            }
        }
    }
}
