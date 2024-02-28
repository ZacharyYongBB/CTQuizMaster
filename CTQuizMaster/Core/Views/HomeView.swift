//
//  SwiftUIView.swift
//  CTQuizMaster
//
//  Created by Zachary on 27/2/24.
//

import SwiftUI

struct HomeView: View {
    
    var difficulties: [String] = ["easy", "medium", "hard"]
    
    
    var body: some View {
        NavigationStack {
            VStack {
                gameDescription
                Spacer()
                ForEach(difficulties, id: \.self) { d in
                    NavigationLink(value: d) {
                        Text("Attempt \(d)")
                            .modifier(HomeButtonViewModifier())
                    }
                }
                Spacer()
                NavigationLink {
                    LeaderboardView()
                } label: {
                    Text("GO TO LEADERBOARD")
                        .modifier(HomeButtonViewModifier())
                }

                Spacer()
            }
            .navigationTitle("Quiz Master")
            .navigationDestination(for: String.self) { value in
                QuizView(difficulty: value)
            }
        }
    }
}


#Preview {
    HomeView()
}

extension HomeView {
    private var gameDescription: some View {
        VStack {
            Text("easy questions are worth 1 pts each")
            Text("medium questions are worth 2 pts each")
            Text("hard questions are worth 3 pts each")
            Text("you have 100 seconds, time remaining / 10 = bonus pts")
        }
        .padding()
    }
}
