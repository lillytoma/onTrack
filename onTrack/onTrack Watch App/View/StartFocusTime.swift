//
//  StartFocusTime.swift
//  onTrack Watch App
//
//  Created by Lilly Toma on 3/27/25.
//

import SwiftUI
import HealthKit

struct StartFocusTime: View {
    @State private var startTime: Date?
    @State private var elapsedTime: Double = 0
    @State private var timer: Timer?
    @State private var isRunning = false
    @EnvironmentObject var workoutManager: WorkoutManager
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Focus Time")
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                Text(formatTime(elapsedTime))
                    .font(.system(size: 30, weight: .bold, design: .monospaced))
                    .padding()
                
                Text("\(workoutManager.heartRate.formatted(.number.precision(.fractionLength(0)))) bpm")
                    .font(.headline)
                    .foregroundStyle(.red)
                
                Spacer()
                
                HStack {
                    Button(action: start) {
                        Text("Start")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(isRunning)
                    
                    Button(action: stop) {
                        Text("Stop")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(!isRunning)
                }
                .padding()
            }
            .padding()
        }
    }
    
    func start() {
        startTime = Date()
        isRunning = true
        workoutManager.startWorkout(workoutType: HKWorkoutActivityType.other)
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if let start = startTime {
                elapsedTime = Date().timeIntervalSince(start)
            }
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
        return String(format: "%02i:%02i", minutes, seconds)
    }
}

#Preview {
    StartFocusTime()
        .environmentObject(WorkoutManager())
}
