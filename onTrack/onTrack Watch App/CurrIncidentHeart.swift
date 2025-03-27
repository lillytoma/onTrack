//
//  CurrIncidentHeart.swift
//  onTrack Watch App
//
//  Created by Lilly Toma on 3/27/25.
//

import SwiftUI

struct CurrIncidentHeart: View {
            @State private var startTime: Date?
            @State private var elapsedTime: Double = 0
            @State private var timer: Timer?
            @State private var isRunning = false
    var body: some View {
        NavigationStack{
            Text("1:30:00") //change time to a variable that captures when the start button was tapped
            
            ZStack{
                Image("heart")
                Text("Incidents\n         5") //change the number 5 to a variable
            }
            HStack{
                NavigationLink(destination: ResumeFocusTime()) {
                    Text("Pause")
                }
                .foregroundStyle(.yellow)
                .frame(width: 80, height: 50)
                Spacer()
                NavigationLink(destination: RingSummary()) {
                    Text("End")
                }
                .foregroundStyle(.red)
                .frame(width: 80, height: 50)
            }
            .padding()
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
    CurrIncidentHeart()
}
