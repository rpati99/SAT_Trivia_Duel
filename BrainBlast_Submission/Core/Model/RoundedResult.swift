//
//  RoundedResult.swift
//  BrainBlast_Submission
//
//  Created by Rachit Prajapati on 3/20/25.
//

import Foundation

struct RoundResult {
    let question: Question
    let player1Answer: String
    let player1Time: TimeInterval
    let player2Answer: String
    let player2Time: TimeInterval
    let winner: Int?  // 1 for Player 1, 2 for Player 2, nil for tie
}
