//
//  StartFocusTime.swift
//  onTrack Watch App
//
//  Created by Lilly Toma on 3/27/25.
//

import SwiftUI

struct StartFocusTime: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Focus Time")
                Spacer()
                NavigationLink(destination: CurrIncidentHeart()) {
                    Text("Start")
                        .foregroundStyle(.green)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    StartFocusTime()
}
