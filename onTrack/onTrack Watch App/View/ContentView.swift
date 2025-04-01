//
//  ContentView.swift
//  onTrack Watch App
//
//  Created by Lilly Toma on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(WorkoutManager.self) var workoutManager: WorkoutManager
    var body: some View {
        TabView{
            StartFocusTime()
            CurrIncidentHeart()
        }
        .tabViewStyle(.verticalPage)
    }
}

#Preview {
    ContentView()
        .environment(WorkoutManager())

}
