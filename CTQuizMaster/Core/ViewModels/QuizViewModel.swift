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
    
    var difficulty: String
    init(difficulty: String, quiz: [Quiz]? = nil, tasks: [Task<Void, Never>]) {
        self.difficulty = difficulty
        self.quiz = quiz
        self.tasks = tasks
        self.currentScore = currentScore
        self.currentQn = currentQn
    }
    
    var quizService: QuizService {
        return QuizService(difficulty: difficulty)
    }
    
    @Published private(set) var quiz: [Quiz]? = nil
    @Published private(set) var currentScore: Int = 0
    @Published private(set) var currentQn: Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach { $0.cancel() }
        tasks = []
    }
    
    func fetchQuizes() {
        let task = Task {
            do {
                quiz = try await quizService.getQuiz()
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
    
    func onCorrect() {
        switch difficulty {
        case "easy":
            currentScore += 1
        case "medium":
            currentScore += 2
        case "hard":
            currentScore += 3
        default:
            currentScore += 1
        }
        currentQn += 1
    }
    
    func onWrong() {
        currentScore -= 1
        currentQn += 1
    }
    
    func onQuizEnd(timeLeft: Int) {
        currentScore += (timeLeft / 10)
    }
}
