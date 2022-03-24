//
//  World_AppsApp.swift
//  World Apps
//
//  Created by taichi on 2022/03/22.
//

import SwiftUI

@main
struct World_AppsApp: App {
    init() {
        let coloredNavAppearance = UINavigationBarAppearance()
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .systemBackground
        coloredNavAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

