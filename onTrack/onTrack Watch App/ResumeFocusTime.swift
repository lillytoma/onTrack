//
//  ResumeFocusTime.swift
//  onTrack Watch App
//
//  Created by Lilly Toma on 3/27/25.
//

import SwiftUI

struct ResumeFocusTime: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Ready to Return?")
                Spacer()
                NavigationLink(destination: CurrIncidentHeart()) {
                    Text("Resume")
                        .foregroundStyle(.green)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ResumeFocusTime()
}
