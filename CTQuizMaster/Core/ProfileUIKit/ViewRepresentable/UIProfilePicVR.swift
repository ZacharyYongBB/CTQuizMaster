//
//  ProfilePicVR.swift
//  CTQuizMaster
//
//  Created by Zachary on 23/3/24.
//


import SwiftUI

struct UIProfilePicVR: UIViewRepresentable {
    
    @Binding var imageName: String
    
    init(image: Binding<String>) {
        self._imageName = image
    }
    
    func makeUIView(context: Context) -> UIImageView {
        return UIImageView()
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        uiView.image = UIImage(systemName: imageName)
    }
}
