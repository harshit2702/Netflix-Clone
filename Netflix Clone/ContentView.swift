//
//  ContentView.swift
//  Netflix Clone
//
//  Created by Harshit Agarwal on 06/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Label("Home",systemImage: "house")
                }
            UpcomingView()
                    .tabItem{
                        Label("Upcoming",systemImage: "play.circle")
                    }
            SearchView()
                .tabItem{
                    Label("Search",systemImage: "magnifyingglass")
                }
            MeAndDownloadView()
                .tabItem{
                    Label("Me",systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

