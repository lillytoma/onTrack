//
//  ContentView.swift
//  onTrack Watch App
//
//  Created by Lilly Toma on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
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
        .environmentObject(WorkoutManager())

}
