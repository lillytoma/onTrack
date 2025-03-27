//
//  onTrackApp.swift
//  onTrack Watch App
//
//  Created by Lilly Toma on 3/24/25.
//

import SwiftUI

@main
struct onTrackApp: App {
    @StateObject private var workoutManager = WorkoutManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    workoutManager.requestAuthorization()
                }
        }
        .environmentObject(workoutManager)
    }
}
