//
//  InstructionsPG1.swift
//  LandmarkDash
//
//  Created by Danielle Abrams on 2/5/25.
//

import SwiftUI

struct InstructionsPG1: View {
    var body: some View {
        ZStack{
            Color("backgroundColor")
                .ignoresSafeArea()
            Text("Hit each landmark as fast as you can to complete the race. Fastest time gets first place on the leaderboard. \n Beat your best time!")
                .padding()
        }
    }
}

#Preview {
    InstructionsPG1()
}
