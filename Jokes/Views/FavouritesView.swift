//
//  FavouritesView.swift
//  Jokes
//
//  Created by Cyrus Chen on 17/4/2023.
//
import Blackbird
import SwiftUI

struct FavouritesView: View {
    
    //MARK: Stored propreties
    
    @BlackbirdLiveModels({ db in
        try await Joke.read(from: db)
    }) var favouriteJokes
  
    var body: some View {
        NavigationView{
            List(favouriteJokes.results){ currentJoke in
                VStack(alignment: .leading){
                    Text(currentJoke.setup)
                        .bold()
                    Text(currentJoke.punchline)
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        TabView{
            JokeView()
                .tabItem{
                    Label("french",systemImage: "carrot")
                }
            FavouritesView()
                .tabItem{
                    Label("favourites", systemImage: "face.smiling")
                }
                
        }
            .environment(\.blackbirdDatabase, AppDatabase.instance)

    }
}
