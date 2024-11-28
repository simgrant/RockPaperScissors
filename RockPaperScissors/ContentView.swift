//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Simone  on 11/27/24.
//

import SwiftUI

struct ContentView: View {
    // store three possible moves
    var moves = ["Rock", "Paper", "Scissors"]
    // store app/player moves and score
    @State private var appMove = ""
    @State private var playerMove = ""
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    
    // generate the app's move
    func generateMove() {
        if let random = moves.randomElement() {
            appMove = random
        }
    }
    
    // check for user win or loss
    func playerResult() {
        if (playerMove == "Rock" && appMove == "Scissors") ||
            (playerMove == "Paper" && appMove == "Rock") || (playerMove == "Scissors" && appMove == "Paper") {
            // player wins
            score += 1
        } else if (playerMove == appMove) {
            //draw
            score = score
        } else {
            // loss
            score -= 1
        }
        shouldWin.toggle()
    }
    
    
    var body: some View {
        VStack {
            
        }
    }
}

#Preview {
    ContentView()
}
