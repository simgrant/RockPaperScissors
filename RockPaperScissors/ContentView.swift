//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Simone  on 11/27/24.
//

import SwiftUI

enum Emoji {
    case rock
    case paper
    case scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "🪨"
        case .paper:
            return "📃"
        case .scissors:
            return "✂️"
        }
    }
}

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
        
        if score < 0 {
            score = 0
        }
    }
    
    func generateMsg() -> String {
        return (shouldWin ? "You're going to win!" : "You're going to lose!")
    }
    
    //TODO: Figure this out
    func display(_ emoji: String) -> Emoji?  {
        switch emoji.lowercased() {
        case "rock":
            return .rock
        case "paper":
            return .paper
        case "scissors":
            return .scissors
        default:
            return nil
        }
    }
    
//TODO: Add opponent score
//    TODO: Add alert to start game & keep track of win/losses
    
    var body: some View {
        NavigationView {
                VStack {
                    
                    HStack {
                        
                        //game prediction (shouldWin)
                        Text("🔮 Prediction:")
                            .font(.system(size: 15))
                        
                        Text(generateMsg())
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding()
                    
                    //                    Spacer()
                    
                    //                Player Choices
                    Text("👇 Make your move 👇")
                        .font(.system(size: 25))
                        .padding()
                    VStack {
                        Button {
                            playerMove = "Rock"
                            generateMove()
                            playerResult()
                        } label: {
                            Text("🪨")
                                .font(.system(size: 50))
                            
                        }
                        .padding()
                        .border(Color.gray, width: 2)
                        .cornerRadius(7)
                        
                        
                        Button {
                            playerMove = "Paper"
                            generateMove()
                            playerResult()
                        } label: {
                            Text("📃")
                                .font(.system(size: 50))
                        }
                        .padding()
                        .border(Color.gray, width: 2)
                        .cornerRadius(7)
                        
                        
                        Button {
                            playerMove = "Scissors"
                            generateMove()
                            playerResult()
                        } label: {
                            Text("✂️")
                                .font(.system(size: 50))
                        }
                        .padding()
                        .border(Color.gray, width: 2)
                        .cornerRadius(7)
                        
                    }
                    
                                        Spacer()
                                        Text("You chose: \(playerMove)")
                    
                                        //                App choice
                                        Text("Your opponent chose: \(appMove)")
                    
                    Spacer()
                    
                    //player score
                    Text("Score: \(score)")
                        .font(.system(size: 25))
                }
                .navigationTitle("Rock, Paper, Scissors!")
                .navigationBarTitleDisplayMode(.automatic)
                .padding()
            }
            .padding()
        
        }
    
    }
    
    
    #Preview {
        ContentView()
    }
