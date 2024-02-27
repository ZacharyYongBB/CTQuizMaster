//
//  SwiftUIView.swift
//  CTQuizMaster
//
//  Created by Zachary on 27/2/24.
//

import SwiftUI

struct HomeView: View {
    
    var difficulties: [String] = ["easy", "medium", "hard"]
    
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(difficulties, id: \.self) { d in
                    NavigationLink(value: d) {
                        Text("Go to \(d)")
                    }
                }
            }
            .navigationTitle("Quiz Master")
            .navigationDestination(for: String.self) { value in
                QuizView(difficulty: value)
            }
        }
    }
}


#Preview {
    HomeView()
}
