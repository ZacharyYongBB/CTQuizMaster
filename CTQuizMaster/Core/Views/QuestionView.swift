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
    @State private var isShowingLeaderboard = false
    @State var timeRemaining: Int
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        VStack {
            Spacer()
            Text(quiz.question)
                .padding()
            Spacer()
            ForEach(quiz.correctAndIncorrectAnswers, id: \.self) { x in
                Button(x) {
                    if vm.currentQn == 9  {
                        isShowingLeaderboard.toggle()
                        vm.onQuizEnd(timeLeft: timeRemaining)
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
        .sheet(isPresented: $isShowingLeaderboard , onDismiss: {
            presentationMode.wrappedValue.dismiss()
        }) {
            LeaderboardView(vm: vm)
        }
    }
}
