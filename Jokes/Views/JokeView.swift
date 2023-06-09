//
//  JokeView.swift
//  Jokes
//
//  Created by Cyrus Chen on 14/4/2023.
//
import Blackbird
import SwiftUI

struct JokeView: View {
    
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    @State var punchlineOpacity = 0.0
    
    @State var currentJoke: Joke?
    
    @State var savedToDatabase = false
    var body: some View {
        
        NavigationView{
            
            VStack{
                Spacer()
                
                if let currentJoke = currentJoke{
                    Text(currentJoke.setup)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        withAnimation(.easeIn(duration: 1.0)){
                            punchlineOpacity = 1.0
                        }
                    }, label: {
                        Image(systemName: "arrow.down.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .tint(.black)
                    })
                    
                    Text(currentJoke.punchline)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .opacity(punchlineOpacity)
                }else{
                    ProgressView()
                }
                
                Spacer()
                Button(action: {
                    // Reset the interface
                    punchlineOpacity = 0.0
                    
                    Task {
                        // Get another joke
                        withAnimation {
                            currentJoke = nil
                        }
                        currentJoke = await NetworkService.fetch()
                        
                        savedToDatabase = false
                    }
                }, label: {
                    Text("Fetch another one")
                })
                .disabled(punchlineOpacity == 0.0 ? true : false)
                .buttonStyle(.borderedProminent)
                
                Button(action: {
                    Task{
                        if let currentJoke = currentJoke{
                            try await db!.transaction{ core in
                                try core.query("INSERT INTO Joke (id, type, setup, punchline) Values (?,?,?,?)",
                                               currentJoke.id,
                                               currentJoke.type,
                                               currentJoke.setup,
                                               currentJoke.punchline)
                                savedToDatabase = true
                            }
                        }
                    }
                }, label: {
                    Text("Save for later")
                })
                .disabled(savedToDatabase == true ? true: false)
                .disabled(punchlineOpacity == 0.0 ? true : false)
                .tint(.green)
                .buttonStyle(.borderedProminent)
            }
            
            .navigationTitle("Fresh Jokes")
        }
        .task {
            if currentJoke == nil{
                currentJoke = await NetworkService.fetch()
            }
        }
    }
}
struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
