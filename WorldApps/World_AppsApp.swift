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
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

