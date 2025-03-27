//
//  StartFocusTime.swift
//  onTrack Watch App
//
//  Created by Lilly Toma on 3/27/25.
//

import SwiftUI

struct StartFocusTime: View {
    @State private var startTime: Date?
    @State private var elapsedTime: Double = 0
    @State private var timer: Timer?
    @State private var isRunning = false
    var body: some View {
        
            NavigationStack{
                VStack{
                    Text("Focus Time")
                    Spacer()
                    Button(action: start){
                        Text("Start")
                    }
                    
                    .foregroundStyle(.green)
                    Spacer()
                }
        }
    }
    func start() {
        startTime = Date()
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            elapsedTime = Date().timeIntervalSince(startTime!)
        }
    }
    
    func stop() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
    func formatTime(_ time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%03i", minutes, seconds)
    }
}

#Preview {
    StartFocusTime()
}
