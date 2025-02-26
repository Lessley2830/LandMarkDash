//
//  InstructionsPG3.swift
//  LandmarkDash
//
//  Created by Danielle Abrams on 2/5/25.
//

import SwiftUI

struct InstructionsPG3: View {
    var body: some View {
        ZStack{
            Color("backgroundColor")
                .ignoresSafeArea()
            Text("Collect Power Boost for and increase in speed or health. \n Speed Boost: 15 MPH faster. \n Life Boost: Extra 10 points in life.")
                .padding()
        }
    }
}

#Preview {
    InstructionsPG3()
}
