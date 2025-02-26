//
//  InstructionsPG2.swift
//  LandmarkDash
//
//  Created by Danielle Abrams on 2/5/25.
//

import SwiftUI

struct InstructionsPG2: View {
    var body: some View {
        ZStack{
            Color("backgroundColor")
                .ignoresSafeArea()
            Text("Collect each momento that correlates with the landmark. Each new momento improves your time!")
                .padding()
        }
    }
}

#Preview {
    InstructionsPG2()
}
