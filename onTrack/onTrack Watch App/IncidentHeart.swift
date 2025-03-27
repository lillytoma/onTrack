//
//  IncidentHeart.swift
//  onTrack Watch App
//
//  Created by Lilly Toma on 3/27/25.
//

import SwiftUI
import WatchKit

struct IncidentHeart: View {
    @State private var incidentCount: Double = 5 // Use Double for Digital Crown
    @State private var elapsedTime: TimeInterval = 9002 // Example time (2:30:02)
    @FocusState private var isFocused: Bool
    
    // Timer formatted as HH:MM:SS
    var formattedTime: String {
        let hours = Int(elapsedTime) / 3600
        let minutes = (Int(elapsedTime) % 3600) / 60
        let seconds = Int(elapsedTime) % 60
        return String(format: "%d:%02d:%02d", hours, minutes, seconds)
    }
    
    var body: some View {
        ScrollView { // Using ScrollView ensures Digital Crown indicator is visible
            VStack {
                // Timer Display
                Text(formattedTime)
                    .font(.title3)
                    .bold()
                    .padding(.top, 10)
                
                // Heart with Incidents Count
                ZStack {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.red)
                    
                    VStack {
                        Text("Incidents")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("\(Int(incidentCount))") // Convert back to Int for display
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .focusable()
                            .focused($isFocused)
                    }
                }
                .padding()
                
                // Stop & Pause Buttons
                HStack {
                    Button(action: {
                        // Stop Action
                        incidentCount = 0
                    }) {
                        Text("Stop")
                            .font(.body)
                            .padding()
                            .frame(width: 70)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    
                    Button(action: {
                        // Pause Action
                    }) {
                        Text("Pause")
                            .font(.body)
                            .padding()
                            .frame(width: 70)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                }
                .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity) // Ensures proper layout inside ScrollView
        }
        .focusable()
        .digitalCrownRotation($incidentCount, from: 0.0, through: 99.0, by: 1.0, sensitivity: .medium, isContinuous: true, isHapticFeedbackEnabled: true)
        .navigationTitle("Adjust Incidents") // Helps trigger Digital Crown bubbles
    }
}

#Preview {
    IncidentHeart()
}
