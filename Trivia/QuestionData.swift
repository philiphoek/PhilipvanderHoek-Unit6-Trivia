//
//  QuestionData.swift
//  Trivia
//
//  Created by Philip van der Hoek on 14/03/2018.
//  Copyright © 2018 Philip van der Hoek. All rights reserved.
//

import Foundation

struct QuestionItem: Codable {
//    var id: Int
    var answer: String
    var question: String
//    var value: Int
//    var category_id: Int
    
    
    enum CodingKeys: String, CodingKey {
//        case id
        case answer
        case question
//        case value
//        case category_id
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try valueContainer.decode(Int.self, forKey: CodingKeys.id)
        self.answer = try valueContainer.decode(String.self, forKey: CodingKeys.answer)
        self.question = try valueContainer.decode(String.self, forKey: CodingKeys.question)
//        self.value = try valueContainer.decode(Int.self, forKey: CodingKeys.value)
//        self.category_id = try valueContainer.decode(Int.self, forKey: CodingKeys.category_id)
    }
}

struct Score: Codable {
    var player: String
    var points: Int
}

struct Highscores: Codable {
    let highscores: [Score]
}

