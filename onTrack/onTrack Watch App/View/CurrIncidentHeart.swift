//
//  CurrIncidentHeart.swift
//  onTrack Watch App
//
//  Created by Lilly Toma on 3/27/25.
//

import SwiftUI

struct CurrIncidentHeart: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    let startCount = 0

    var body: some View {
            NavigationStack{
                Text("1:30:00") //change time to a variable that captures when the start button was tapped
                
                ZStack{
                    Image("heart")
                    Text("Incidents\n         \(incidentCounter())") //change the number 5 to a variable
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
    func incidentCounter() -> Int{
        var count = 0
        if(workoutManager.heartRate > 90){
            count = count + 1
        }
        return count
    }

}

#Preview {
    CurrIncidentHeart()
        .environmentObject(WorkoutManager())
}
