//
//  RoundResultPopupView.swift
//  BrainBlast_Submission
//
//  Created by Rachit Prajapati on 3/20/25.
//

import Foundation
import SwiftUI

struct RoundResultPopup: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Round \(viewModel.roundResults.count) Result")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.yellow)
            
            if let result = viewModel.roundResults.last {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Question:")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(result.question.text)
                        .font(.body)
                        .foregroundColor(.white)
                    
                    Divider().background(Color.white)
                    
                    Text("Player 1: \(result.player1Answer) in \(String(format: "%.2f", result.player1Time)) s")
                        .foregroundColor(.white)
                    Text("Player 2: \(result.player2Answer) in \(String(format: "%.2f", result.player2Time)) s")
                        .foregroundColor(.white)
                    
                    if let winner = result.winner {
                        Text("Winner: Player \(winner)")
                            .font(.title2)
                            .foregroundColor(.green)
                    } else {
                        Text("Round Tied")
                            .font(.title2)
                            .foregroundColor(.red)
                    }
                }
                .padding()
            }
            
            Button(action: {
                viewModel.nextRound()
            }) {
                Text("Next Round")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.8))
                .shadow(radius: 10)
        )
        .padding(40)
    }
}

#Preview {
    RoundResultPopup(viewModel: GameViewModel())
}
