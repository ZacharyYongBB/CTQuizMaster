//
//  ProfileView.swift
//  CTQuizMaster
//
//  Created by Zachary on 3/3/24.
//

import SwiftUI

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: DBUser? = nil
    
    func loadCurrentUser() async throws {
        let authDataRes = try AuthManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataRes.uid)
    }
    
}

struct ProfileView: View {
    
    @StateObject private var vm = ProfileViewModel()
    
    var body: some View {
        List {
            if let user = vm.user {
                Text("User Id: \(user.userId)")
                
                if let email = user.email {
                    Text("Email: \(email)")
                }
                if let dateCreated = user.dateCreated {
                    Text("Date Created: \(dateCreated)")
                }
            }
        }
        .task {
            try? await vm.loadCurrentUser()
        }
        .navigationTitle("Profile")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "gear")
                    .font(.title)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
