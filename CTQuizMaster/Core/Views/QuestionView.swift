//
//  QuestionView.swift
//  CTQuizMaster
//
//  Created by Zachary on 27/2/24.
//

import SwiftUI

struct QuestionView: View {
    
    var quiz: Quiz
    var vm: QuizViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text(quiz.question)
            Spacer()
            ForEach(quiz.correctAndIncorrectAnswers, id: \.self) { x in
                Button(x) {
                    if vm.currentQn == 9  {
                        print("COMPLETE")
                    } else {
                        if x == quiz.correctAnswer {
                            vm.onCorrect()
                        } else {
                            vm.onWrong()
                        }
                    }
                    
                }
            }
            
            Spacer()
        }
        .frame(width: 300, height: 400, alignment: .center)
        .background(Color.red)
        .padding(20)
    }
}
