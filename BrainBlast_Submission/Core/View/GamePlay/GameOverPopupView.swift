import SwiftUI

struct GameOverPopup: View {
    @ObservedObject var viewModel: GameViewModel
    
    var winnerText: String {
        viewModel.player1Score > viewModel.player2Score ? "🎉 Player 1 Wins! 🎉" : "🎉 Player 2 Wins! 🎉"
    }
    
    var winnerColor: Color {
        viewModel.player1Score > viewModel.player2Score ? .blue : .green
    }
    
    var body: some View {
        VStack(spacing: 15) {
            Text("🏁 GAME OVER 🏁")
                .font(.largeTitle).bold()
                .foregroundColor(.white)
                .padding(.top, 20)
                .shadow(radius: 5)
                .scaleEffect(1.2)
            
            Text(winnerText)
                .font(.title).bold()
                .foregroundColor(winnerColor)
                .padding(.bottom, 10)
                .scaleEffect(1.1)
            
            ScrollView {
                ForEach(viewModel.roundResults.indices, id: \.self) { index in
                    let result = viewModel.roundResults[index]
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Round \(index + 1)")
                                .font(.headline)
                                .foregroundColor(.purple)
                            Spacer()
                            if let w = result.winner {
                                Text("🥳 Player \(w)!")
                                    .foregroundColor(.orange)
                                    .bold()
                            } else {
                                Text("😐 Tie!")
                                    .foregroundColor(.red)
                                    .bold()
                            }
                        }
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("P1: \(result.player1Answer)")
                                    .bold()
                                    .foregroundColor(.blue)
                                Text("⏱️ \(String(format: "%.2f s", result.player1Time))")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text("P2: \(result.player2Answer)")
                                    .bold()
                                    .foregroundColor(.green)
                                Text("⏱️ \(String(format: "%.2f s", result.player2Time))")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.9)))
                    .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 3)
                    .padding(.horizontal, 5)
                }
            }
            .frame(maxHeight: 400)
            
            Button(action: {
                viewModel.restartGame()
            }) {
                Text("🔄 Play Again!")
                    .font(.title2).bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient(colors: [Color.purple, Color.blue], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(15)
                    .shadow(radius: 5)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.9), Color.black.opacity(0.6)]),
                startPoint: .top,
                endPoint: .bottom)
            .cornerRadius(25)
            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        )
        .padding(20)
        .transition(.scale.combined(with: .opacity))
        .animation(.spring(), value: viewModel.phase)
    }
}

#Preview {
    GameOverPopup(viewModel: GameViewModel())
}
