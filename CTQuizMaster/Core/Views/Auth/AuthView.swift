//
//  AuthView.swift
//  CTQuizMaster
//
//  Created by Zachary on 29/2/24.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject private var vm = AuthViewModel()
    @State private var isShowingCreateUser = false
    @Binding var showSignInView: Bool
    @State private var showAlertWrongSignIn: Bool = false
    @State  var showCreatedAlert: Bool = false
    @State  var showCreatedFailAlert:Bool = false
    
    var body: some View {
        VStack {
            TextField("Enter Email", text: $vm.email)
                .TextFieldFormat()
            SecureField("Enter Password", text: $vm.password)
                .TextFieldFormat()
            Button {
                Task {
                    let success = try await vm.signIn()
                    if success {
                        showSignInView = false
                    } else {
                        showAlertWrongSignIn.toggle()
                    }
                }
                
            } label: {
                Text("Sign In")
                    .homeButtonFormat(color: Color.blue)
            }
            
            Button("Dont have an account? Create one!") {
                isShowingCreateUser.toggle()
            }
        }
        .alert(isPresented: $showAlertWrongSignIn, content: {
            vm.wrongSignInCredentialsAlert()
        })
//        .alert(isPresented: $showCreatedAlert, content: {
//            vm.accountCreatedAlert()
//        })
        .padding()
        .navigationTitle("Sign In")
        .sheet(isPresented: $isShowingCreateUser) {
            CreateAccountView(vm: vm, showCreatedAlert: $showCreatedAlert)
        }
    }
}

#Preview {
    AuthView(showSignInView: .constant(false))
}
