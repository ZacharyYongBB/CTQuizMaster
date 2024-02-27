//
//  ContentView.swift
//  CTQuizMaster
//
//  Created by Zachary on 26/2/24.
//

import SwiftUI

struct QuizView: View {
    
    let difficulty: String
    @StateObject private var vm: QuizViewModel
    @State var isStarted: Bool = false
    @State var timeRemaining = 100
    
    
    init(difficulty: String) {
        self.difficulty = difficulty
        self._vm = StateObject(wrappedValue: QuizViewModel(difficulty: difficulty, tasks: []))
    }
    
    
    var body: some View {
        ScrollView {
            headers
            if let quiz = vm.quiz {
                QuestionView(quiz: quiz[vm.currentQn], vm: vm)
            }
        }
        .onReceive(vm.timer, perform: { time in
            if timeRemaining > 0 && isStarted {
                timeRemaining -= 1
            }
        })
        .onDisappear {
            vm.cancelTasks()
        }
        
    }
}

#Preview {
    QuizView(difficulty: "HARD")
}

extension QuizView {
    private var headers: some View {
        VStack {
            Text(difficulty)
                .font(.title)
            Text("currentScore :\(vm.currentScore)")
                .font(.subheadline)
            Text("timeRemaining :\(timeRemaining)")
                .font(.subheadline)
            if !isStarted {
                Button("START") {
                    vm.difficulty = difficulty
                    vm.fetchQuizes()
                    isStarted = true
                }
            }
        }
    }
}
