//
//  CTQuizMasterApp.swift
//  CTQuizMaster
//
//  Created by Zachary on 26/2/24.
//

import SwiftUI
import Firebase

@main
struct CTQuizMasterApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
