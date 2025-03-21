import SwiftUI

struct FunnyOnboardingView: View {
    @State private var currentPage = 0
    @Binding var onboardingCompleted: Bool
    @State private var animateEmoji = false
    
    private let totalPages = 3
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.orange, .pink, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            TabView(selection: $currentPage) {
                // Page 1 - Immediate Emoji Animation
                VStack(spacing: 20) {
                    Spacer()
                    Text("🤯 SAT Math Trivia!")
                        .font(.largeTitle).bold()
                        .foregroundColor(.white)
                    Text("Ever dreamt of beating your friend...\nusing algebra?")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.9))
                    Spacer()
                    Image(systemName: "brain.head.profile")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .foregroundColor(.yellow)
                        .rotationEffect(.degrees(animateEmoji ? 360 : 0))
                        .animation(.linear(duration: 4).repeatForever(autoreverses: false), value: animateEmoji)
                    Spacer()
                }
                .tag(0)
                .onAppear {
                    animateEmoji = true
                }
                
                // Page 2
                VStack(spacing: 20) {
                    Spacer()
                    Text("⏰ Answer Fast, Think Later")
                        .font(.largeTitle).bold()
                        .foregroundColor(.white)
                    Text("First one to answer correctly wins.\nSecond place gets shame. 😜")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.9))
                    Spacer()
                    Image(systemName: "hare.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .foregroundColor(.green)
                        .offset(x: currentPage == 1 ? 0 : -200)
                        .animation(.interpolatingSpring(stiffness: 70, damping: 6).delay(0.2), value: currentPage)
                    Spacer()
                }
                .tag(1)
                
                // Page 3
                VStack(spacing: 20) {
                    Spacer()
                    Text("🏆 Glory Awaits!")
                        .font(.largeTitle).bold()
                        .foregroundColor(.white)
                    Text("Win 3 rounds to claim eternal bragging rights\nand questionable respect.")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.9))
                    Spacer()
                    Image(systemName: "trophy.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .foregroundColor(.yellow)
                        .scaleEffect(currentPage == 2 ? 1.2 : 0.8)
                        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: currentPage)
                    Spacer()
                    
                    Button(action: {
                        onboardingCompleted = true
                    }) {
                        Text("Start the Duel! ⚔️")
                            .font(.title2).bold()
                            .foregroundColor(.purple)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 15)
                            .background(.white)
                            .clipShape(Capsule())
                            .shadow(radius: 10)
                    }
                    .padding(.top, 20)
                }
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }.onAppear {
            AudioPlayer.shared.playClip(named: "Audio")
        }
    }
}


#Preview {
    FunnyOnboardingView(onboardingCompleted: .constant(false))
}
