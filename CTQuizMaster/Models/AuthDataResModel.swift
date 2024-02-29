//
//  AuthDataResModel.swift
//  CTQuizMaster
//
//  Created by Zachary on 29/2/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResModel {
    let uid: String
    let email: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}
