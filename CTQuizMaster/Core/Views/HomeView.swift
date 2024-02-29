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
        
        VStack {
            gameDescription
            Spacer()
            ForEach(difficulties, id: \.self) { d in
                NavigationLink(value: d) {
                    HStack {
                        Text(LocalizedStringKey("attempt"))
                        Text("\(d)")
                            .textCase(.uppercase)
                    }
                    .homeButtonFormat(color: Color.red)
                }
            }
            Spacer()
            NavigationLink {
                LeaderboardView()
            } label: {
                Text(LocalizedStringKey("goToLeaderBoard"))
                    .homeButtonFormat(color: Color.purple)
            }
            
            Spacer()
        }
        .navigationTitle(LocalizedStringKey("gameTitle"))
        .navigationDestination(for: String.self) { value in
            QuizView(difficulty: value)
        }
        
    }
}


#Preview {
    HomeView()
}

extension HomeView {
    private var gameDescription: some View {
        VStack (alignment: .center, spacing: 20) {
            Text(LocalizedStringKey("instructions"))
                .font(.title2)
                .fontWeight(.bold)
            Text(LocalizedStringKey("easyDesc"))
            Text(LocalizedStringKey("medDesc"))
            Text(LocalizedStringKey("hardDesc"))
            Text(LocalizedStringKey("timeDesc"))
        }
        .font(.title3)
        .multilineTextAlignment(.center)
        .padding()
    }
}
