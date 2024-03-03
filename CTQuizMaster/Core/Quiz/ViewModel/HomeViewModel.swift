//
//  HomeViewModel.swift
//  CTQuizMaster
//
//  Created by Zachary on 29/2/24.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    
    func logOut() throws {
        try AuthManager.shared.signOut()
    }
    
}
