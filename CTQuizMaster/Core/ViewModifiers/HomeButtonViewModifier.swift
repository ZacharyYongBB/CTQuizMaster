//
//  HomeButtonViewModifier.swift
//  CTQuizMaster
//
//  Created by Zachary on 28/2/24.
//

import Foundation
import SwiftUI

struct HomeButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundStyle(.white)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.red)
            .cornerRadius(10.0)
            .shadow(radius: 10.0)
            .padding()
    }
}

