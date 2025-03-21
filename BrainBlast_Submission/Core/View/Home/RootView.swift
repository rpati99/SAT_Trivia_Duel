//
//  TransitionView.swift
//  BrainBlast_Submission
//
//  Created by Rachit Prajapati on 3/20/25.
//

import Foundation
import SwiftUI

struct RootView: View {
    @State private var onboardingCompleted = false

    var body: some View {
        ZStack {
            if onboardingCompleted {
                // Replace this with your game's main view:
                GameScreenView()
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            } else {
                FunnyOnboardingView(onboardingCompleted: $onboardingCompleted)
                    .transition(.scale.combined(with: .opacity))
            }
        }
        .animation(.easeInOut, value: onboardingCompleted)
    }
}

