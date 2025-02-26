//
//  GameOverView.swift
//  LandmarkDashBeta
//
//  Created by Danielle Abrams on 2/18/25.
//

import SwiftUI

struct GameOverView: View {
    
    @EnvironmentObject var scene:GameScene
    var body: some View {
        
        ZStack{
            
            Color.secondary
            
            VStack{
                Text("Game Over").foregroundColor(.red).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Button(action: {scene.gameOver = false}, label: {
                    Text("Start Again")
                })
                
               
                    
                    
                
            }
        }
       
    }
}

#Preview {
    GameOverView()
}
