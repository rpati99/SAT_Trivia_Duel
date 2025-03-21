//
//  GameViewModel.swift
//  BrainBlast_Submission
//
//  Created by Rachit Prajapati on 3/20/25.
//
import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    @Published var questions: [Question] = hardcodedQuestions
    @Published var currentQuestion: Question = hardcodedQuestions.randomElement()!
    @Published var player1Score = 0
    @Published var player2Score = 0
    @Published var phase: GamePhase = .player1Turn
    @Published var roundResults: [RoundResult] = []
    @Published var turnStartTime: Date? = Date()
    
    // Temporary storage for answers and response times.
    var player1Answer: (answer: String, time: TimeInterval)?
    var player2Answer: (answer: String, time: TimeInterval)?
    
    func startNewRound() {
        phase = .player1Turn
        turnStartTime = Date()
        player1Answer = nil
        player2Answer = nil
        if let randomQ = questions.randomElement() {
            currentQuestion = randomQ
        }
    }
    
    func submitAnswer(_ answer: String) {
        guard let start = turnStartTime else { return }
        let elapsed = Date().timeIntervalSince(start)
        
        switch phase {
        case .player1Turn:
            player1Answer = (answer, elapsed)
            withAnimation {
                phase = .player2Turn
            }
            turnStartTime = Date() // Restart timer for Player 2.
        case .player2Turn:
            player2Answer = (answer, elapsed)
            evaluateRound()  // Evaluate round; this may set phase to .gameOver.
            // Only transition to round result popup if game is not over.
            if phase != .gameOver {
                withAnimation {
                    phase = .roundResult
                }
            }
        default:
            break
        }
    }
    
    func evaluateRound() {
        guard let p1 = player1Answer, let p2 = player2Answer else { return }
        let q = currentQuestion
        var winner: Int? = nil
        let p1Correct = p1.answer == q.correctAnswer
        let p2Correct = p2.answer == q.correctAnswer
        
        if p1Correct && p2Correct {
            winner = (p1.time <= p2.time) ? 1 : 2
        } else if p1Correct {
            winner = 1
        } else if p2Correct {
            winner = 2
        }
        
        if winner == 1 { player1Score += 1 }
        else if winner == 2 { player2Score += 1 }
        
        let result = RoundResult(
            question: q,
            player1Answer: p1.answer,
            player1Time: p1.time,
            player2Answer: p2.answer,
            player2Time: p2.time,
            winner: winner
        )
        roundResults.append(result)
        
        // Check if a player has won 3 rounds.
        if player1Score >= 3 || player2Score >= 3 {
            withAnimation {
                phase = .gameOver
            }
        }
    }
    
    func nextRound() {
        withAnimation {
            startNewRound()
        }
    }
    
    func restartGame() {
        player1Score = 0
        player2Score = 0
        roundResults = []
        startNewRound()
    }
}

