import SwiftUI

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

#Preview {
    GameScreenView()
}

