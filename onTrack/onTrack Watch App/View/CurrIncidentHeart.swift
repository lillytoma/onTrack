//
//  CurrIncidentHeart.swift
//  onTrack Watch App
//
//  Created by Lilly Toma on 3/27/25.
//

import SwiftUI

struct CurrIncidentHeart: View {
    @Environment(WorkoutManager.self) var workoutManager

//    @State private var startTime: Date?
//    @State private var elapsedTime: Double = 0
//    @State private var timer: Timer?
//    @State private var isRunning = false

    var body: some View {
            NavigationStack{
                Text(workoutManager.formatTime(workoutManager.elapsedTime))
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                
                ZStack{
                    Image("heart")
                    Text("Incidents\n         \(workoutManager.incidentCounter())") //change the number 5 to a variable
                }
//                HStack{ decided to remove this and have the start and stop on a different page
//                    NavigationLink(destination: ResumeFocusTime()) {
//                        Text("Pause")
//                    }
//                    .foregroundStyle(.yellow)
//                    .frame(width: 80, height: 50)
//                    Spacer()
//                    NavigationLink(destination: RingSummary()) {
//                        Text("End")
//                    }
//                    .foregroundStyle(.red)
//                    .frame(width: 80, height: 50)
//                }
//                .padding()
            }
        } 
}

#Preview {
    CurrIncidentHeart()
        .environment(WorkoutManager())
}
