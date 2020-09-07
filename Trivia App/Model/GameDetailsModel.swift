//
//  GameDetailsModel.swift
//  Trivia App
//
//  Created by heena thapar on 06/09/20.
//  Copyright © 2020 heena thapar. All rights reserved.
//

import Foundation
struct GameDetailsModel {
    var name: String!
    var dateTime: String!
    var answerOne: String!
    var answerTwo: String!
    
    
    static func getRoundOneOptions() -> [String] {
         let options = ["Sachin Tendulkar","Virat Kohli", "Adam Gilchirst", "Jacques Kallis"]
        return options
    }
    
    static func getRoundTwoOptions() -> [String] {
        let options =  ["White","Yellow", "Orange", "Green"]
        return options
   }
}

