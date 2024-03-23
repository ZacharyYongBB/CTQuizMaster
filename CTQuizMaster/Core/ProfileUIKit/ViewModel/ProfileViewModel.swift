//
//  ProfileViewModel.swift
//  CTQuizMaster
//
//  Created by Zachary on 12/3/24.
//

import SwiftUI

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: DBUser = DBUser(userId: "", email: "", picture: "", dateCreated: Date.now)
    
    func loadCurrentUser() async throws {
        let authDataRes = try AuthManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataRes.uid)
    }
    
}
