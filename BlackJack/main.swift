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
    var newCard : Hand
    
    // The pile
    var pile : Hand
    
    
    
    init() {
        
        // Make a deck of cards
        deck = Deck()
        
        // Initialize the hands
        player1 = Hand(description: "player1")
        player2 = Hand(description: "player2")
        pile = Hand(description: "pile")
        newCard = Hand(description: "newCard")
        
        
        // Set initial defence and offence sides
              defence = player1
              offence = player2
        
        
        if let newCard = self.deck.randomlyDealOut(thisManyCards: 1) {
            offence.cards = newCard
        }
      
        
        // Game is about to start
        print("==========")
        print("START GAME")
        print("==========\n")
        
        print("It's Player1's turn to draw")
        
        play()
        
        
    }
    
    
    // Deal a card from the offence's hand
    private func deal() {
        
        // Deal from offence's hand to the pile
        pile.cards.append(offence.dealTopCard()!)
        
        //        // What's in the pile?
        //        describeCards(in: pile)
        
       
        
        func confrontation () {
            
        
            
            
            switchOffence()

            
            
        }
        
        
        // Check for confrontation
        if offence.rank.count <= 11 {
            confrontation()
        }
        
        
        
        
        // Changes the current offence to become the defence, and vice versa
        func switchOffence() {
            
            print("\nChanging roles...")
            
            if offence === player1 {
                print("\nOffence: Computer")
                offence = player2
                print("Defence: Player\n")
                defence = player1
            } else {
                print("\nOffence: Player")
                offence = player1
                print("Defence: Computer\n")
                defence = player2
            }
        }
        
        // defence beats offence, now switch roles
        switchOffence()
        
        
    }
    
    
    
    
    private func play() {
        
        // Loop until valid input provided by user
        while true {
            
            // Ask for input
            print("Press 0: stop drawing; Press any other integer: continue drawing")
            guard let inputGiven = readLine() else {
                
                // No input given, return to top of loop and ask again
                continue
            }
            
            // Attempt to make input into an integer
            guard let integerGiven = Int(inputGiven) else {
                
                // Could not make input into an integer, so return to top and ask again
                print("Please input an integer")
                continue
            }
            
            // Check that integer is in desired range
            // REMEMBER: Guard statement conditions describe what we WANT
            guard integerGiven == 0 else {
                
                let newCard = offence.dealTopCard()
                offence.cards.append(newCard!)
                print("Now you have \(offence.cards) ")
                // Integer not in desired range, return to top and ask again
                continue
               
             
                
            }
            
            
            print("Now is other player's turn to draw.")
            
            
            // Stop looping
            break
            
            
        }
        
        //if the total value is greater than 21, you lost this round
        if offence.rank.count >= 21 {
            print("you are doomed")
        }
        
        if defence.rank.count >= 21 {
            print("you are doomed")
        }
        
        //player1 starts drawing the top card by pressing "Y" and ends drawing by pressing "N"
        
        //display a warning message if the value surpasses 17
        
        //player2 starts drawing the top card by pressing "Y" and ends drawing by pressing "N"
        
        //display a warning message if the value surpasses 17
        
        //compare the final value of player1&2
        
        //determine the winner for the round, display score
        
        //repeat until one player wins 10 rounds
        
    }
    
    
    // example
}


let aGame = BlackJack()

