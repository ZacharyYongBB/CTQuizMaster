//
//  ProfileView.swift
//  CTQuizMaster
//
//  Created by Zachary on 3/3/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var vm = ProfileViewModel()
    @State var userId: String = ""
    @State var email: String = ""
    @State var joinDate: String = ""
    @State var profilePic: String = "star"
    
    var body: some View {
        NavigationStack {
            VStack {
                UIProfilePicVR(image: $profilePic)
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                    Text("User ID:")
                    UILabelVR(text: $userId)
                }
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                    Text("Email:")
                    UILabelVR(text: $email)
                }
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                    Text("Join Date:")
                    UILabelVR(text: $joinDate)
                }
            }
            .padding()
            .toolbar(content: {
                NavigationLink(destination: EditProfileView()) {
                    HStack {
                        Image(systemName: "gear")
                            .font(.title)
                        Text("Edit Profile")
                        Spacer()
                    }
                }
            })
        }
        .task {
            try? await vm.loadCurrentUser()
            self.userId = vm.user.userId
            email = vm.user.email ?? ""
            joinDate = vm.user.dateCreated?.dateToString() ?? ""
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
