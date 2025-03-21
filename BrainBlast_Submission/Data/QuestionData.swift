//
//  GameModel.swift
//  BrainBlast_Submission
//
//  Created by Rachit Prajapati on 3/20/25.
//
import Foundation

let hardcodedQuestions: [Question] = [
    Question(
        text: "ALG001: Liam and Emma bought books and notebooks from a stationery store. Liam purchased 6 books and 3 notebooks for $138, while Emma purchased 5 books and 7 notebooks for $250. Which system of equations represents this situation?",
        options: [
            "6x + 3y = 138, 5x + 7y = 250",
            "6x + 5y = 138, 3x + 7y = 250",
            "6x + 3y = 250, 5x + 7y = 138",
            "6x + 5y = 250, 3x + 7y = 138"
        ],
        correctAnswer: "A"
    ),
    Question(
        text: "ALG002: 8q = 24,  p – 7q = –5. What is the value of p + q?",
        options: ["–29", "–19", "19", "29"],
        correctAnswer: "C"
    ),
    Question(
        text: "ALG003: b = 8a + 16,  b = 40. What is the solution (a, b)?",
        options: ["(3, 40)", "(16, 40)", "(40, 3)", "(40, 16)"],
        correctAnswer: "A"
    ),
    Question(
        text: "ALG004: A concert venue sells two types of tickets. A general ticket costs $7 and a VIP ticket costs $15. If 300 tickets were sold for $3,500, which system of equations represents this situation?",
        options: [
            "g + v = 300, 7g + 15v = 3500",
            "g + v = 300, 15g + 7v = 3500",
            "7g + 15v = 300, g + v = 3500",
            "15g + 7v = 300, g + v = 3500"
        ],
        correctAnswer: "A"
    ),
    Question(
        text: "ALG005: a = 12,  b = a – 8. What is the value of b?",
        options: ["4", "8", "12", "20"],
        correctAnswer: "A"
    ),
    Question(
        text: "ALG006: m – n = 30 and 7n = m. What is the solution (m, n)?",
        options: ["(35, 5)", "(36, 6)", "(34, 4)", "(30, 0)"],
        correctAnswer: "A"
    ),
    Question(
        text: "ALG007: a = 28 and b = a – 12. What is the value of b?",
        options: ["2.3", "28", "12", "16"],
        correctAnswer: "D"
    ),
    Question(
        text: "ALG008: n = 3m – 5,  m = 6. What is the solution (m, n)?",
        options: ["(6, 18)", "(6, 13)", "(5, 10)", "(5, 20)"],
        correctAnswer: "B"
    ),
    Question(
        text: "ALG009: 6c + 2d = 31,  –5c – d = –11. What is the value of c + d?",
        options: ["–42", "–20", "20", "–42"],
        correctAnswer: "C"
    ),
    Question(
        text: "ALG010: t = 7s + 13,  t = 34. What is the solution (s, t)?",
        options: ["(7, 34)", "(3, 34)", "(34, 7)", "(34, 3)"],
        correctAnswer: "B"
    ),
    Question(
        text: "ALG011: –3p + 2q = 7.7,  3p + 4q = 6.3. What is the value of q?",
        options: ["–91/90", "3/7", "5/3", "7/3"],
        correctAnswer: "D"
    ),
    Question(
        text: "ALG012: In the system: 7/2 n – 1/2 m = 3/4 – 3/2 n,  3/4 m + 1/4 – m/2 = k·n + 9/4, if there is no solution, what is the value of k?",
        options: ["–10", "2/5", "2", "5/2"],
        correctAnswer: "D"
    ),
    Question(
        text: "ALG013: In the system: p·x + 2q·y = 83 and 14x + 4q·y = 70, if the graphs intersect at (4, y), what is the value of p?",
        options: ["–19", "–5", "5", "19"],
        correctAnswer: "D"
    ),
    Question(
        text: "ALG014: The system –9p + 18q = 24 and –3p + 6q = –8 has how many solutions?",
        options: ["Exactly one", "Exactly two", "Infinitely many", "Zero"],
        correctAnswer: "D"
    ),
    Question(
        text: "ALG015: 30p – 54q = 26q + 37 and s·q = 1/5 – 6p. If the system has no solution, what is the value of s?",
        options: ["–16", "–6", "16", "400"],
        correctAnswer: "A"
    ),
    Question(
        text: "ALG016: 5m – 15n = 10n + 25 and k·n = 1/5 + m. If the system has no solution, what is the value of k?",
        options: ["–5", "1/5", "5", "125"],
        correctAnswer: "C"
    ),
    Question(
        text: "ALG017: During a month, Alex walked p miles at 7 mph and skated q miles at 14 mph. If p + q = 350 and he skated for thrice as many hours as he walked, how many miles did he skate?",
        options: ["140", "210", "280", "300"],
        correctAnswer: "D"
    ),
    Question(
        text: "ALG018: 5/4 p + 1/2 q = 1/6. In the system with 7k·p + 2q = m, if there are infinitely many solutions, what is the value of k?",
        options: ["–7/4", "0", "5/7", "7/4"],
        correctAnswer: "C"
    ),
    Question(
        text: "ALG019: z = 7p + 13,  3z = 20p + 15. What is the value of p – z?",
        options: ["–179", "–24", "131", "155"],
        correctAnswer: "C"
    ),
    Question(
        text: "ALG020: In the system: y = 3x + 11 and y = p·x – 5, if there is no solution, what is the value of p?",
        options: ["–11/3", "0", "3", "11"],
        correctAnswer: "C"
    )
]
