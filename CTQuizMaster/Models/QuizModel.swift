//
//  File.swift
//  CTQuizMaster
//
//  Created by Zachary on 26/2/24.
//

import Foundation

// MARK: - Welcome
struct QuizModel: Decodable {
    let responseCode: Int?
    let results: [Quiz]?
    
    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}

// MARK: - Result
struct Quiz: Identifiable, Decodable, Hashable {
    let type: TypeEnum?
    let difficulty: Difficulty?
    let category, question, correctAnswer: String
    let incorrectAnswers: [String]?
    
    var id: String {
        question + correctAnswer
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decodeIfPresent(TypeEnum.self, forKey: .type)
        difficulty = try container.decodeIfPresent(Difficulty.self, forKey: .difficulty)
        category = try container.decodeIfPresent(String.self, forKey: .category) ?? ""
        question = try container.decodeIfPresent(String.self, forKey: .question) ?? ""
        correctAnswer = try container.decodeIfPresent(String.self, forKey: .correctAnswer) ?? ""
        incorrectAnswers = try container.decodeIfPresent([String].self, forKey: .incorrectAnswers)
    }
    
    
    
    enum CodingKeys: String, CodingKey {
        case type, difficulty, category, question, correctAnswer = "correct_answer", incorrectAnswers = "incorrect_answers", id
    }
}

enum Difficulty: String, Decodable {
    case easy
    case hard
    case medium
}

enum TypeEnum: String, Decodable {
    case boolean
    case multiple
}
