//
//  Joke.swift
//  Jokes
//
//  Created by Cyrus Chen on 14/4/2023.
//

import Foundation

struct Joke: Identifiable{
    let type : String
    let setup: String
    let punchline: String
    let id: String
}

let examplejoke = Joke(type: "general", setup: "When do doctors get angry?", punchline: "When they run out of patients.", id: 285)
