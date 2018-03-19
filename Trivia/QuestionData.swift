//
//  QuestionData.swift
//  Trivia
//
//  Created by Philip van der Hoek on 14/03/2018.
//  Copyright © 2018 Philip van der Hoek. All rights reserved.
//

import Foundation

struct QuestionItem: Codable {
    var answer: String
    var question: String
    
    
    enum CodingKeys: String, CodingKey {
        case answer
        case question
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.answer = try valueContainer.decode(String.self, forKey: CodingKeys.answer)
        self.question = try valueContainer.decode(String.self, forKey: CodingKeys.question)
    }
}

struct Score: Codable {
    var player: String
    var points: Int
}

struct Highscores: Codable {
    let highscores: [Score]
}

