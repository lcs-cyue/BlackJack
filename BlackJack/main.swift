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
        
        
        // Deal 3 cards to player1
        if let newCards = self.deck.randomlyDealOut(thisManyCards: 3) {
            player1.cards = newCards
        }
        
        // Deal 3 cards to player2
        if let newCards = self.deck.randomlyDealOut(thisManyCards: 3) {
            player2.cards = newCards
        }
        
        // Set initial defence and offence sides
        defence = player1
        offence = player2
        
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
            
            // defence can draw 3 cards from the pile
            let newCard = defence.dealTopCard()
            
            switchOffence()
            //            offence.cards.append(newCard)
            
            
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

