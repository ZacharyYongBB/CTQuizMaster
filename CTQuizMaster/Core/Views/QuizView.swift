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
    
    init(difficulty: String) {
        self.difficulty = difficulty
        self._vm = StateObject(wrappedValue: QuizViewModel(difficulty: difficulty, tasks: []))
    }
    
    var body: some View {
        VStack {
            Text(difficulty)
            Button("START") {
                vm.difficulty = difficulty
                vm.fetchQuizes()
            }
            if let quiz = vm.quiz {
                ForEach(quiz) { q in
                    Text(q.question)
                }
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
