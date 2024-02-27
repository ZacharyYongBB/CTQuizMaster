//
//  QuestionView.swift
//  CTQuizMaster
//
//  Created by Zachary on 27/2/24.
//

import SwiftUI

struct QuestionView: View {
    
    var quiz: Quiz
    @State private var shuffledOptions: [String] = []
    
    init(quiz: Quiz) {
        self.quiz = quiz
        let quizOptions = [quiz.correctAnswer] + (quiz.incorrectAnswers ?? [])
        self._shuffledOptions = State(initialValue: quizOptions.shuffled())
    }
    
    var body: some View {
        VStack {
            Text(quiz.question)
            
            ForEach(shuffledOptions, id: \.self) { option in
                Button(option) {
                    // Handle button tap
                }
            }
        }
        .frame(height: 400, alignment: .center)
        .background(Color.red)
    }
}

