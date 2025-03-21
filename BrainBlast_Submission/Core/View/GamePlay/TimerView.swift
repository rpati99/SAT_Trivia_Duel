//
//  TimerView.swift
//  BrainBlast_Submission
//
//  Created by Rachit Prajapati on 3/20/25.
//

import Foundation
import SwiftUI

struct TimerView: View {
    var startTime: Date?
    @State private var elapsed: TimeInterval = 0
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text(String(format: "Time: %.2f s", elapsed))
            .font(.subheadline)
            .foregroundColor(.green)
            .fontWeight(.bold)
            .onReceive(timer) { _ in
                if let start = startTime {
                    elapsed = Date().timeIntervalSince(start)
                }
            }
    }
}

#Preview {
    TimerView(startTime: Date.now)
}
