//
//  ContentView.swift
//  CineFilx
//
//  Created by adithyan na on 13/6/25.
//

import SwiftUI

struct ContentView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        // Set background color using RGBA
        appearance.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.0)
        
        // Apply the appearance to all tab bars
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView{
            Tab(Constants.lblHomeTitle, systemImage:"house") {
                HomeView()
            }
            
            Tab(Constants.lblUpcomingTitle, systemImage:"play.circle") {
               UpcomingView()
            }
            Tab(Constants.lblSearchTitle, systemImage:"magnifyingglass") {
                SearchScreenView()
            }
            Tab(Constants.lblDowloadTitle, systemImage:"arrow.down") {
               DownloadScreen()
                
            }
            
        }
        .tint(.white)
       
        
    }
}

#Preview {
    ContentView()
}
