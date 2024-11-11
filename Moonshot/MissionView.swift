//
//  MissionView.swift
//  Moonshot
//
//  Created by Anna Filin on 21/10/2024.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember: Hashable {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                        
                    }
                
    
                VStack(alignment: .leading) {
                    
                    RectDevider()
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    RectDevider()
                    
                    Text("Mission launch date")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.formattedLaunchDate)
                    
                    RectDevider()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                }
                .padding(.horizontal)
                

                HorizontalScroll(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        .navigationDestination(for: CrewMember.self) { crewMember in
            AstronautView(astronaut: crewMember.astronaut)
        }
    }
        
    
        init(mission: Mission, astronauts: [String: Astronaut]) {
            self.mission = mission

            self.crew = mission.crew.map { member in
                if let astronaut = astronauts[member.name] {
                    return CrewMember(role: member.role, astronaut: astronaut)
                } else {
                    fatalError("Missing \(member.name)")
                }
            }
        }
 
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}

