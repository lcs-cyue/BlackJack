//
//  main.swift
//  BlackJack
//
//  Created by Yue, Chelsea on 2020/3/11.
//  Copyright © 2020 Chelsea Yue. All rights reserved.
//

import Foundation
//some problems: 1.interactive mode, 2.order of the deck 3...

// Create a new datatype to represent a game of BlackJack
class BlackJack {
    
    // The deck of cards
    var deck : Deck
    
    // The hands for each player
    var player1 : Hand
    var player2 : Hand
    var offence : Hand
    var defence : Hand
    
    // The pile
    var pile : Hand
    
    
    init() {
        
        // Make a deck of cards
        deck = Deck()
        
        // Initialize the hands
        player1 = Hand(description: "player1")
        player2 = Hand(description: "player2")
        pile = Hand(description: "pile")
        
        
        // Set initial defence and offence sides
        defence = player1
        offence = player2
        
        // Game is about to start
        print("==========")
        print("START GAME")
        print("==========\n")
        
        print("It's Player1's turn to draw")
        
        play()
        
        
        //Interactive mode???????IDK how to continue
        
        //create a dictionary that uses the first letter as a key and the words that begin with that letter as the values
        let dict = [
            "y": ["Yes"],
            "n": ["No"]
        ]
        
        
        
    }
    
    
    
    private func play() {
        keyPress()
        
        //player1 starts drawing the top card by pressing "Y" and ends drawing by pressing "N"
        
        //display a warning message if the value surpasses 17
        
        //player2 starts drawing the top card by pressing "Y" and ends drawing by pressing "N"
        
        //display a warning message if the value surpasses 17
        
        //compare the final value of player1&2
        
        //determine the winner for the round, display score
        
        //repeat until one player wins 10 rounds
        
    }
    
    func keyPress() {
        print("Press 'Y' to continue drawing", terminator: "y")
        readLine()
    }
    
    
}


let aGame = BlackJack()

