//
//  HorizontalScroll.swift
//  Moonshot
//
//  Created by Anna Filin on 22/10/2024.
//

import SwiftUI

struct HorizontalScroll: View {
   
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink(value: crewMember) {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.leading, 10)
        }
    }
    
 
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
       let crew = [
           MissionView.CrewMember(role: "Commander", astronaut: astronauts["armstrong"]!),
           MissionView.CrewMember(role: "Pilot", astronaut: astronauts["aldrin"]!)
       ]
     
  
   HorizontalScroll(crew: crew)
}
