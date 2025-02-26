//
//  DisplayGameView.swift
//  LandmarkDashBeta
//
//  Created by Danielle Abrams on 2/18/25.
//

import SwiftUI
import SpriteKit
import GameKit

struct DisplayGameView: View {
    @EnvironmentObject var scene: GameScene
   
    var body: some View {
        if scene.gameOver == false {
            SpriteView(scene: scene)
                .frame(width: 1024, height: 768)
                .ignoresSafeArea()
        } else if scene.gameOver == true {
            GameOverView()
        }
    }
}

#Preview {
    DisplayGameView()
        .environmentObject(GameScene())
}
