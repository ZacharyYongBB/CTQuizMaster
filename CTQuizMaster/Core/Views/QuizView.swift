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
    
    
    init(difficulty: String) {
        self.difficulty = difficulty
        self._vm = StateObject(wrappedValue: QuizViewModel(difficulty: difficulty, tasks: []))
    }
    
    
    var body: some View {
        ScrollView {
            Text(difficulty)
                .font(.title)
            Text("currentScore :\(vm.currentScore)")
                .font(.subheadline)
            if !isStarted {
                Button("START") {
                    vm.difficulty = difficulty
                    vm.fetchQuizes()
                    isStarted = true
                }
            }
            if let quiz = vm.quiz {
                QuestionView(quiz: quiz[vm.currentQn], vm: vm)
            }
        }
        .onDisappear {
            vm.cancelTasks()
        }
        
    }
}

#Preview {
    QuizView(difficulty: "HARD")
}
