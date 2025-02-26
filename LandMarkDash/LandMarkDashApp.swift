//
//  LandMarkDashApp.swift
//  LandMarkDash
//
//  Created by Lessly C. Romero-Rodriguez on 2/26/25.
//

import SwiftUI

@main
struct LandMarkDashApp: App {
    @StateObject var scene = GameScene()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(scene)
        }
    }
}
