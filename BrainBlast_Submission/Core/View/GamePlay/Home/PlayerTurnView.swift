//
//  PlayerTurnView.swift
//  BrainBlast_Submission
//
//  Created by Rachit Prajapati on 3/20/25.
//

import Foundation
import SwiftUI

struct PlayerTurnView: View {
    @ObservedObject var viewModel: GameViewModel
    let playerNumber: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Player \(playerNumber)'s Turn")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
            
            Text("Round \(viewModel.roundResults.count + 1)")
                .font(.title2)
                .foregroundColor(.white)
            
            ScrollView {
                Text(viewModel.currentQuestion.text)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding()
            }
            .frame(maxHeight: 300)
            
            TimerView(startTime: viewModel.turnStartTime)
            
            VStack(spacing: 16) {
                ForEach(Array(zip(viewModel.currentQuestion.options.indices, viewModel.currentQuestion.options)), id: \.0) { index, option in
                    Button(action: {
                        let answerLetter = ["A", "B", "C", "D"][index]
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                            viewModel.submitAnswer(answerLetter)
                        }
                    }) {
                        Text(option)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .shadow(radius: 4)
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PlayerTurnView(viewModel: GameViewModel(), playerNumber: 2)
}
