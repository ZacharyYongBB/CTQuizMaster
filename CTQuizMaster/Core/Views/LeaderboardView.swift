//
//  LeaderboardView.swift
//  CTQuizMaster
//
//  Created by Zachary on 27/2/24.
//

import SwiftUI

struct LeaderboardView: View {
    
    var vm: QuizViewModel
    
    var body: some View {
        VStack{
            Text("HERE IS YOUR FINAL SCORE: \(vm.currentScore)")
        }
    }
}

