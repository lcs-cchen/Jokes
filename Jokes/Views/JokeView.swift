//
//  JokeView.swift
//  Jokes
//
//  Created by Cyrus Chen on 14/4/2023.
//

import SwiftUI

struct JokeView: View {
    var body: some View {
        NavigationView{
        VStack{
                Text("You can see mountain's aren't funny.")
                .font(.title)
                .multilineTextAlignment(.center)
            
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
