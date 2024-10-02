//
//  RidesApp.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-09-27.
//

import SwiftUI

@main
struct RidesApp: App {
    
    @StateObject private var vm = VehicleViewModel(inputText: "")
    @State private var showLaunchView: Bool = true
    
    init()
    {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.themeColor.accentColor)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.themeColor.accentColor)]
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack
            {
                NavigationView {
                    VehicleListView(showAlert: false)
                }
                .environmentObject(vm)

                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}
