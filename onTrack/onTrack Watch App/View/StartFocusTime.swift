//
//  StartFocusTime.swift
//  onTrack Watch App
//
//  Created by Lilly Toma on 3/27/25.
//

import SwiftUI
import HealthKit

struct StartFocusTime: View {
//    @State private var startTime: Date?
//    @State private var elapsedTime: Double = 0
//    @State private var timer: Timer?
//    @State private var isRunning = false
//    @State var elapsedTime: Double = 0
    

    @Environment(WorkoutManager.self) var workoutManager: WorkoutManager
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Focus Time")
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                Text(workoutManager.formatTime(workoutManager.elapsedTime))
                    .font(.system(size: 30, weight: .bold, design: .monospaced))
                    .padding()
                
                Text("\(workoutManager.heartRate.formatted(.number.precision(.fractionLength(0)))) bpm")
                    .font(.headline)
                    .foregroundStyle(.red)
                
                Spacer()
                
                HStack {
                    Button(action: startUpdate) {
                        Text("Start")
                            .padding()
                            .foregroundStyle(.black)
                            .frame(width: 85, height: 50)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .disabled(workoutManager.isRunning)
                    
                    Button(action: stopUpdate) {
                        Text("Stop")
                            .padding()
                            .foregroundStyle(.black)
                            .frame(width: 85, height: 50)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(!workoutManager.isRunning)
                }
                .padding()
            }
            .padding()
        }
    }
    
    func startUpdate(){
        workoutManager.start()
    }
    func stopUpdate(){
        workoutManager.stop()
    }
    
//    func start() {
//        startTime = Date()
//        isRunning = true
//        workoutManager.startWorkout(workoutType: HKWorkoutActivityType.other)
//        
//        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
//            if let start = startTime {
//                elapsedTime = Date().timeIntervalSince(start)
//            }
//        }
//    }
//    
//    func stop() {
//        isRunning = false
//        timer?.invalidate()
//        timer = nil
//    }
//    
//    func formatTime(_ time: Double) -> String {
//        let minutes = Int(time) / 60
//        let seconds = Int(time) % 60
//        return String(format: "%02i:%02i", minutes, seconds)
//    }
}

#Preview {
    StartFocusTime()
        .environment(WorkoutManager())
}
