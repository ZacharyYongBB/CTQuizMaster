//
//  BadgesViewModifier.swift
//  CTQuizMaster
//
//  Created by Zachary on 28/2/24.
//

import Foundation
import SwiftUI

struct BadgesViewModifier: ViewModifier {
    let tint: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 60))
            .foregroundStyle(tint)
    }
}

extension View {
    func badgesFormat(color: Color) -> some View {
        modifier(BadgesViewModifier(tint: color))
    }
}
