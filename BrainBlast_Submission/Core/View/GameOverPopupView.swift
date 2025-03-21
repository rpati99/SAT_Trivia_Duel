//
//  GameOverPopupView.swift
//  BrainBlast_Submission
//
//  Created by Rachit Prajapati on 3/20/25.
//

import Foundation
import SwiftUI

struct GameOverPopup: View {
    @ObservedObject var viewModel: GameViewModel
    
    var winnerText: String {
        viewModel.player1Score > viewModel.player2Score ? "Player 1 Wins!" : "Player 2 Wins!"
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Game Over")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.yellow)
            
            Text(winnerText)
                .font(.title)
                .foregroundColor(.green)
            
            List(viewModel.roundResults.indices, id: \.self) { index in
                let result = viewModel.roundResults[index]
                VStack(alignment: .leading, spacing: 4) {
                    Text("Round \(index + 1)")
                        .font(.headline)
                    Text("P1: \(result.player1Answer) in \(String(format: "%.2f", result.player1Time)) s")
                        .font(.caption)
                    Text("P2: \(result.player2Answer) in \(String(format: "%.2f", result.player2Time)) s")
                        .font(.caption)
                    if let w = result.winner {
                        Text("Winner: Player \(w)")
                            .font(.caption)
                            .foregroundColor(.orange)
                    } else {
                        Text("Round Tied")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
            }
            .frame(height: 300)
            
            Button(action: {
                viewModel.restartGame()
            }) {
                Text("Restart Game")
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
