//
//  JokeView.swift
//  Jokes
//
//  Created by Cyrus Chen on 14/4/2023.
//

import SwiftUI

struct JokeView: View {
    
    @State var punchlineOpacity = 0.0
    
    @State var currentJoke = exampleJoke
    var body: some View {
        
        NavigationView{
            
        VStack{
            
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
            
            }
            
        .navigationTitle("Random Jokes")
        }
    }
}
struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
    }
}
