//
//  JokesApp.swift
//  Jokes
//
//  Created by Cyrus Chen on 14/4/2023.
//

import SwiftUI

@main
struct JokesApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                JokeView()
                    .tabItem{
                        Label("french",systemImage: "carrot")
                    }
                FavouritesView()
                    .tabItem{
                        Label("favourites", systemImage: "face.smilling")
                    }
                    
            }
            .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
