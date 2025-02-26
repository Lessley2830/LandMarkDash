//
//  InstructionsView.swift
//  LandmarkDash
//
//  Created by Danielle Abrams on 2/4/25.
//

import SwiftUI

struct InstructionsView: View {
   // @EnvironmentObject var scene:GameScene
    var body: some View {
        ZStack {
            
            Image("skyline")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack{
                Text("Instructions")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Group {
                    TabView{
                        InstructionsPG1()
                        InstructionsPG2()
                        InstructionsPG3()
                        InstructionsPG4()
                    }
                    .tabViewStyle(.page)
                    .frame(width: 400, height: 200, alignment: .center)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width:15,height:15)))
                }
                
                NavigationLink(destination: DisplayGameView()) {
                    Text("ROLL OUT")
                        .foregroundStyle(Color("backgroundColor"))
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color("buttonColor"))
                        .cornerRadius(10)
                        .padding()
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
//                Button(action:{DisplayGameView()}
//                       label: {
//                    Text("Start Game")
//                        .padding()
//                        .frame(width: 150, height: 50)
//                        .background(Color("buttonColor"))
//                        .cornerRadius(10)
//                        .padding()
//                })
            }
            
        }
    }
}

#Preview {
    InstructionsView()
     //   .environmentObject(GameScene())
}
