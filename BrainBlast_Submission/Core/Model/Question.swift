//
//  Question.swift
//  BrainBlast_Submission
//
//  Created by Rachit Prajapati on 3/20/25.
//
import Foundation

struct Question: Identifiable, Codable {
    var id = UUID()
    let text: String
    let options: [String]
    // Correct answer is stored as a letter: "A", "B", "C", or "D"
    let correctAnswer: String
}
