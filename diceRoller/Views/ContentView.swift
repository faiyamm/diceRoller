//
//  ContentView.swift
//  diceRoller
//
//  Created by Fai on 11/03/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DiceViewModel()
    
    var body: some View {
        ZStack {
            Color(red: 0.5, green: 0.7, blue: 1.0).ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Dice Roller")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 25) {
                    Text(viewModel.statusMessage)
                        .foregroundColor(.gray)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.white)
                            .frame(width: 200, height: 200)
                        
                        if viewModel.isRunning {
                            DiceView(value: viewModel.diceValue)
                        } else {
                            Image(systemName: "hand.raised.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.gray.opacity(0.3))
                        }
                    }
                }
                .padding(40)
                .background(Color.white.opacity(0.9))
                .cornerRadius(30)
                
                Button(action: { viewModel.toggle() }) {
                    Text(viewModel.isRunning ? "STOP" : "START")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.isRunning ? Color.red : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 50)
            }
        }
    }
}
