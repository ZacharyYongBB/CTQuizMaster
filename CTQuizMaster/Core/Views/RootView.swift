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
            NavigationStack {
                HomeView(showSignInView: $showSignInView)
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
