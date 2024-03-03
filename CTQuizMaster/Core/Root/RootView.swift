//
//  RootView.swift
//  CTQuizMaster
//
//  Created by Zachary on 29/2/24.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            TabView {
                NavigationStack {
                    HomeView(showSignInView: $showSignInView)
                }
                .tabItem {
                    Image(systemName: "brain")
                    Text("Quiz")
                }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Profile")
                    }
            }
        }
        .onAppear {
            let authUser = try? AuthManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack {
                AuthView(showSignInView: $showSignInView)
            }
        })
    }
}

#Preview {
    RootView()
}
