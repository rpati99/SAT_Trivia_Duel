import SwiftUI

// MARK: - Models and Game Phases

enum GamePhase {
    case player1Turn
    case player2Turn
    case roundResult
    case gameOver
}



struct RoundResult {
    let question: Question
    let player1Answer: String
    let player1Time: TimeInterval
    let player2Answer: String
    let player2Time: TimeInterval
    let winner: Int?  // 1 for Player 1, 2 for Player 2, nil for tie
}

// MARK: - Hardcoded Question Bank


// MARK: - Game ViewModel


// MARK: - Popup Views




// MARK: - Timer View



// MARK: - Main Content View with Popups

struct GameScreenView: View {
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            if viewModel.phase == .player1Turn || viewModel.phase == .player2Turn {
                PlayerTurnView(
                    viewModel: viewModel,
                    playerNumber: viewModel.phase == .player1Turn ? 1 : 2
                )
                .transition(.move(edge: viewModel.phase == .player1Turn ? .leading : .trailing))
            }
            
            if viewModel.phase == .roundResult {
                RoundResultPopup(viewModel: viewModel)
                    .transition(.scale.combined(with: .opacity))
            }
            
            if viewModel.phase == .gameOver {
                GameOverPopup(viewModel: viewModel)
                    .transition(.scale.combined(with: .opacity))
            }
        }
        .animation(.easeInOut, value: viewModel.phase)
    }
}

// MARK: - Player Turn View

