//
//  LeaderboardView.swift
//  CTQuizMaster
//
//  Created by Zachary on 27/2/24.
//

import SwiftUI

struct LeaderboardView: View {
    var vm: QuizViewModel?
    @State private var scores: [Int] = []
    @State private var showAlert: Bool = false
    @State private var isSaved: Bool = false
    
    var body: some View {
        VStack {
            if let currentScore = vm?.currentScore {
                Text("HERE IS YOUR FINAL SCORE: \(currentScore)")
                if !isSaved {
                    Button("Save Score to Leaderboard") {
                        if let score = vm?.currentScore {
                            scores.append(score)
                            UserDefaults.standard.set(scores, forKey: "scores")
                            showAlert.toggle()
                            isSaved = true
                        }
                    }
                }
            }
            
            if !scores.isEmpty {
                let sortedScores = scores.sorted(by: >)
                
                ForEach(sortedScores.indices, id: \.self) { index in
                    HStack {
                        Text("\(index + 1) Place :")
                            .padding(.trailing, 8)
                        Text("\(sortedScores[index])")
                    }
                }
            }
        }
        .alert(isPresented: $showAlert, content: {
            vm?.alertSaved() ?? Alert(title: Text("Score Saved"))
        })
        .onAppear {
            scores = UserDefaults.standard.array(forKey: "scores") as? [Int] ?? []
        }
        .navigationTitle("LEADERBOARD")
    }
    
    
}
