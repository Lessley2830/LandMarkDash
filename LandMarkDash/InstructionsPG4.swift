//
//  InstructionsPG4.swift
//  LandmarkDash
//
//  Created by Danielle Abrams on 2/5/25.
//

import SwiftUI

struct InstructionsPG4: View {
    var body: some View {
        ZStack{
            Color("backgroundColor")
                .ignoresSafeArea()
            Text("Avoid Potholes, construction sites, buildings and getting pulled over by the police. \n Potholes and construction sites loses you 10 life points. \n Running into buildings or getting pulled over by police cost you the whole game... PSST if you can out run the police you can add 5 extra points.")
                .padding()
        }
    }
}

#Preview {
    InstructionsPG4()
}
