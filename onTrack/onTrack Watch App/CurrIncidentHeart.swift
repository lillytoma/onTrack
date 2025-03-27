//
//  CurrIncidentHeart.swift
//  onTrack Watch App
//
//  Created by Lilly Toma on 3/27/25.
//

import SwiftUI

struct CurrIncidentHeart: View {
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
}


#Preview {
    CurrIncidentHeart()
}
