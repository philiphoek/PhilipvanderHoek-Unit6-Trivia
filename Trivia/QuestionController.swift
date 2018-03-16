//
//  QuestionController.swift
//  Trivia
//
//  Created by Philip van der Hoek on 14/03/2018.
//  Copyright © 2018 Philip van der Hoek. All rights reserved.
//

import Foundation

class QuestionController {
    
    static let shared = QuestionController()
    let baseURL = URL(string: "http://jservice.io/api/random")!


    func fetchQuestionItems(completion: @escaping ([QuestionItem]?) -> Void) {
        // Get Random question
        
        let url = baseURL
        let task = URLSession.shared.dataTask(with: url) { (data,
            response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let question = try?
                    jsonDecoder.decode([QuestionItem].self, from: data) {
                completion(question)
            } else {
                print("someting went wrong")
            }
        }
        task.resume()
    }
}
