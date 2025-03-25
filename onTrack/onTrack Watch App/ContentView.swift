//
//  ContentView.swift
//  onTrack Watch App
//
//  Created by Lilly Toma on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var number: Int = 1

    
    func ringColor(for number: Int) -> Color {
        switch number {
        case 0...3:
            return .green
        case 4...7:
            return .yellow
        case 8...10:
            return .red
        default:
            return .gray
        }
    }
    var body: some View {
        NavigationStack {
            Text("Overview")
            ZStack {
                Image(systemName: "circle")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(ringColor(for: number))
                Text("\(number)")
                    .font(.largeTitle)
                    .padding()
            }
            VStack {
                NavigationLink(destination: Heart()) {
                    Text("Done")
                }
                }
                .padding()
            }
        }
        
    }

#Preview {
    ContentView()
}
