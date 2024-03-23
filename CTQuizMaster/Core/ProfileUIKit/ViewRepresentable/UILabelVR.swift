//
//  UILabelVR.swift
//  CTQuizMaster
//
//  Created by Zachary on 22/3/24.
//

import SwiftUI

struct UILabelVR: UIViewRepresentable {
    
    @Binding var text: String
    
    init(text: Binding<String>) {
        self._text = text
    }
    
    func makeUIView(context: Context) -> UILabel {
        let label = getLabel()
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
    }
    
    private func getLabel() -> UILabel {
        let label = CustomTitleLabel(textAlignment: .center, fontSize: 15)
        return label
    }
    
}
