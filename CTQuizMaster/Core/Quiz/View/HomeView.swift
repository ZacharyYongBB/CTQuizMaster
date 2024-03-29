//
//  SwiftUIView.swift
//  CTQuizMaster
//
//  Created by Zachary on 27/2/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var vm = HomeViewModel()
    @Binding var showSignInView: Bool
    
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
            Button {
                Task {
                    do {
                        try vm.logOut()
                        showSignInView = true
                    } catch {
                        print("log out failed \(error)")
                    }
                }
            } label: {
                Text(LocalizedStringKey("logOut"))
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
    HomeView(showSignInView: .constant(true))
}

extension HomeView {
    private var gameDescription: some View {
        VStack (alignment: .center, spacing: 5) {
            Text(LocalizedStringKey("instructions"))
                .font(.title2)
                .fontWeight(.bold)
            Text(LocalizedStringKey("easyDesc"))
            Text(LocalizedStringKey("medDesc"))
            Text(LocalizedStringKey("hardDesc"))
            Text(LocalizedStringKey("timeDesc"))
        }
        .font(.headline)
        .multilineTextAlignment(.center)
        .padding(3)
    }
}
