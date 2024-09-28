//
//  RidesApp.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-09-27.
//

import SwiftUI

@main
struct RidesApp: App {
    
    @StateObject private var vm = VehicleViewModel()
    
    init()
    {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.themeColor.accentColor)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.themeColor.accentColor)]
    }
    
    var body: some Scene {
        WindowGroup {
          //  ContentView()
            NavigationView{
                VehicleListView()
                  //  .navigationBarHidden(true)
                
            }
            .environmentObject(vm)
        }
    }
}
