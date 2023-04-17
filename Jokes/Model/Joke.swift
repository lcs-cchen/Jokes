//
//  Joke.swift
//  Jokes
//
//  Created by Cyrus Chen on 14/4/2023.
//
import Blackbird
import Foundation

struct Joke: Identifiable, Codable, BlackbirdModel {
    @BlackbirdColumn var type : String
    @BlackbirdColumn var setup: String
    @BlackbirdColumn var punchline: String
    @BlackbirdColumn var id: Int
}

let exampleJoke = Joke(type: "general", setup: "When do doctors get angry?", punchline: "When they run out of patients.", id: 285)
