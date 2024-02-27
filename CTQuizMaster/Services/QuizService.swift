//
//  QuizService.swift
//  CTQuizMaster
//
//  Created by Zachary on 26/2/24.
//

import Foundation

actor QuizService {
    let url = URL(string: "https://opentdb.com/api.php?amount=10")!

    func getQuiz() async throws -> [Quiz] {
        do {
            let (data, response) = try await URLSession.shared.data(from: url, delegate: nil)
            return try await parseQuizData(data: data, response: response)
        } catch {
            throw error
        }
    }

    private func parseQuizData(data: Data?, response: URLResponse?) async throws -> [Quiz] {
        do {
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                    throw NSError(domain: "HTTPError", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil)
            }

            let decoder = JSONDecoder()
            do {
                let quizModel = try decoder.decode(QuizModel.self, from: data)
                
                if let quizzes = quizModel.results {
                    return quizzes
                } else {
                    throw NSError(domain: "DecodingError", code: 0, userInfo: [NSLocalizedDescriptionKey: "No quiz data found"])
                }
            } catch let decodingError {
                print("Decoding error: \(decodingError)")
                throw decodingError
            }
        } catch {
            print("Error: \(error)")
            throw error
        }
    }

}

