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
            JokeView()
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
