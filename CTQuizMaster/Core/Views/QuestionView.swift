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
                .foregroundStyle(.white)
            Spacer()
            ForEach(quiz.correctAndIncorrectAnswers, id: \.self) { x in
                Button {
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
                } label: {
                    Text(x)
                        .modifier(OptionButtonViewModifier())
                }
                
            }
            
            Spacer()
        }
        .frame(height: 700, alignment: .center)
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .padding(20)
        .sheet(isPresented: $isShowingLeaderboard , onDismiss: {
            presentationMode.wrappedValue.dismiss()
        }) {
            LeaderboardView(vm: vm)
        }
    }
}
