//
//  ContentView.swift
//  Moonshot
//
//  Created by Anna Filin on 20/10/2024.
//

import SwiftUI



struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var displayGrid = true
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            Group {
                    if displayGrid {
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                ForEach(missions) {mission in
                                    NavigationLink(value: mission) {
                                        VStack {
                                            Image(mission.image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 100)
                                                .padding()
                                            
                                            VStack {
                                                Text(mission.displayName)
                                                    .font(.headline)
                                                    .foregroundStyle(.white)
                                                Text(mission.formattedLaunchDate)
                                                    .font(.caption)
                                                    .foregroundStyle(.white.opacity(0.5))
                                            }
                                            .padding(.vertical)
                                            .frame(maxWidth:  .infinity)
                                            .background(.lightBackground)
                                        }
                                        .clipShape(.rect(cornerRadius: 10))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.lightBackground)
                                        )
                                    }
                                }
                                .padding([.horizontal, .bottom])
                            }
                        }
                    } else {
                        List(missions) { mission in
                            NavigationLink(value: mission) {
                                HStack {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                    
                                    VStack {
                                        Text(mission.displayName)
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                        Text(mission.formattedLaunchDate)
                                            .font(.caption)
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                }
                                .padding(.vertical)
                            }
                        }

                    }
                
            }
            .navigationTitle("Moonshot")
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
            .toolbar {
               ToolbarItem(placement: .navigationBarTrailing) {
                   Button(action: {
                       displayGrid.toggle()
                   }) {
                       Image(systemName: displayGrid ? "square.grid.2x2" : "list.bullet")
                           .font(.title2)
                   }
               }
           }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
        
        
    }
}

#Preview {
    ContentView()
}

