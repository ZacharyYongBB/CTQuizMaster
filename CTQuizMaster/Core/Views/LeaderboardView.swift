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
    @State private var animate: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
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
            Spacer()
            
            VStack {
                Text("BADGES")
                    .font(.title)
                Text("10 pts to get a ⭐️")
                Text("20 pts to get a 🎓")
                Text("30 pts to get a 🧠")
                if let maxScore = scores.max() {
                    Text("max score : \(maxScore)")
                    HStack (spacing: 40) {
                        if maxScore >= 10 {
                            Image(systemName: "star")
                                .badgesFormat(color: .yellow)
                                .rotationEffect(animate ? .degrees(360) : .degrees(0))
                                .onTapGesture {
                                    withAnimation {
                                        animate.toggle()
                                    }
                                }
                        }
                        if maxScore >= 20 {
                            Image(systemName: "graduationcap")
                                .badgesFormat(color: .red)
                                .rotationEffect(animate ? .degrees(360) : .degrees(0))
                                .onTapGesture {
                                    withAnimation {
                                        animate.toggle()
                                    }
                                }
                        }
                        if maxScore >= 30 {
                            Image(systemName: "brain")
                                .badgesFormat(color: .green)
                                .rotationEffect(animate ? .degrees(360) : .degrees(0))
                                .onTapGesture {
                                    withAnimation {
                                        animate.toggle()
                                    }
                                }
                        }
                        
                    }
                    .animation(.easeInOut, value: animate)
                    if maxScore >= 10 {
                        Button("Spin badges") {
                            animate.toggle()
                        }
                    }
                }
                
            }
            Spacer()
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
