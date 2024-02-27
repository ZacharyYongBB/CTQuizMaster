//
//  QuizViewModel.swift
//  CTQuizMaster
//
//  Created by Zachary on 26/2/24.
//

import Foundation
import SwiftUI

@MainActor
class QuizViewModel: ObservableObject {
    
    let quizService = QuizService()
    
    @Published private(set) var quiz: [Quiz]? = nil
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach { $0.cancel() }
        tasks = []
    }
    
    func fetchQuizes() {
        let task = Task {
            do {
                quiz = try await quizService.getQuiz()
                print(quiz)
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
}
