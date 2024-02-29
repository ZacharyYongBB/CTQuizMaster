//
//  CreateAccountView.swift
//  CTQuizMaster
//
//  Created by Zachary on 29/2/24.
//

import SwiftUI

struct CreateAccountView: View {
    
    @ObservedObject var vm: AuthViewModel
    @Binding var showCreatedAlert: Bool
    @State var createdSuccess: Bool = false
    @State private var isButtonScaled = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Create an account")
                .font(.largeTitle)
            TextField("Enter Email", text: $vm.email)
                .TextFieldFormat()
            SecureField("Enter Password", text: $vm.password)
                .TextFieldFormat()
            
            if !createdSuccess {
                Button {
                    Task {
                        createdSuccess = try await vm.createUser()
                        showCreatedAlert.toggle()
                    }
                } label: {
                    Text("Create Account")
                        .homeButtonFormat(color: Color.blue)
                }
                
            }
            
            if createdSuccess {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Back to Sign In")
                        .homeButtonFormat(color: Color.blue)
                        .scaleEffect(isButtonScaled ? 1.1 : 0.8)
                        .animation(.spring(), value: isButtonScaled)
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                                withAnimation {
                                    isButtonScaled.toggle()
                                }
                            }
                        }
                }                
            }
        }
        .alert(isPresented: $showCreatedAlert, content: {
            vm.accountCreatedAlert(success: createdSuccess)
        })
        .padding()
    }
}

#Preview {
    CreateAccountView(vm: AuthViewModel(), showCreatedAlert: .constant(false))
}
