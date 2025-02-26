//
//  welcomepage1.swift
//  LandmarkDash
//
//  Created by Lessly C. Romero-Rodriguez on 2/6/25.
//

import SwiftUI

struct welcomepage1: View {
    var body: some View {
        
        ZStack {
            
            Color("background")
                .ignoresSafeArea()
            
            
           
            
            Image("skyline")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Image("darkLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                
                NavigationLink(destination: InstructionsView()) {
                    Text("LETS RIDE")
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color("buttonColor"))
                        .cornerRadius(10)
                        .padding()
                        .foregroundStyle(Color("backgroundColor"))
                    
//                    NavigationLink(destination: ContentView()) {
//                        Text("ROLL OUT")
//                            .padding()
//                            .frame(width: 150, height: 50)
//                            .background(Color("buttonColor"))
//                            .cornerRadius(10)
//                            .padding()
//                    }
                    
                }
            }
        }
        
    }
}
#Preview {
    welcomepage1()
}

