//
//  ContentView.swift
//  CTQuizMaster
//
//  Created by Zachary on 26/2/24.
//

import SwiftUI

struct QuizView: View {
    
    @StateObject private var vm = QuizViewModel()
    
    var body: some View {
        VStack {
            Button("Start quiz") {
                vm.fetchQuizes()
            }
            if let quizzes = vm.quiz {
                ForEach(quizzes) { q in
                    Text(q.question)
                    Spacer()
                }
            } else {
                Text("🤔")
            }
        }
        .onDisappear {
            vm.cancelTasks()
        }
    }
}

#Preview {
    QuizView()
}
