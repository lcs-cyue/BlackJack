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
//    var newCard : Hand
    private var score = 0
    
    // The pile
    var pile : Hand
    
    
    init() {
        
        // Make a deck of cards
        deck = Deck()
        
        // Initialize the hands
        player1 = Hand(description: "player1")
        player2 = Hand(description: "player2")
        pile = Hand(description: "pile")
//        newCard = Hand(description: "newCard")
        
        
        // Set initial defence and offence sides
        defence = player1
        offence = player2
        

//        if let newCard = self.deck.randomlyDealOut(thisManyCards: 1) {
//            offence.cards = newCard
//        }
//
        
        
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
        
    
        
        // Changes the current offence to become the defence, and vice versa
        func switchOffence() {
            
            
            print("\nChanging roles...")
            
            if offence === player1 {
                print("\nOffence: player2")
                offence = player2
                print("Defence: Player\n")
                defence = player1
            } else {
                print("\nOffence: Player")
                offence = player1
                print("Defence: player2\n")
                defence = player2
            }
        }
        
        // defence beats offence, now switch roles
        switchOffence()
        
    }
    
   
    //Add a point to the winner
    func addPoint() {
        if offence.rank.count >= defence.rank.count {
            score += 1
        } else if defence.rank.count >= offence.rank.count {
            score += 1
        }else if defence.rank.count == offence.rank.count {
            score += 0
        }
        //score.append
    }
    
    
    
    private func play() {
        
        // Loop until valid input provided by user
        while true {
            
            // Ask for input
            print("Press 0: stop the game; Press 1: stop drawing; Press any other integer: continue drawing")
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
            
            // Function to check if the total value is greater than 21
            func check21() {
                //if the total value is greater than 21, you lost this round
                if offence.rank.count >= 21 {
                    print("you are doomed")
                }
                
                if defence.rank.count >= 21 {
                    print("you are doomed")
                }
            }
            
            // Function to check if the value is greater than 17
            func check17() {
                //display a warning message if the value surpasses 17
                if offence.rank.count >= 17 && offence.rank.count < 21 {
                    print("Your total card value is over 17. Do you still want to continue drawing?")
                }
                
                if defence.rank.count >= 17 && defence.rank.count < 21 {
                    print("Your total card value is over 17. Do you still want to continue drawing?")
                }
            }
            
            // Check that integer is in desired range
            // REMEMBER: Guard statement conditions describe what we WANT
            guard integerGiven <= 1 else {
                
                addPoint()
                print("Now you have \(offence.cards) ")
                // Integer not in desired range, return to top and ask again
                check21()
                check17()
                continue
                
                
                
            }
            
            func appendCard() {
                // Get a random value between 0 and the end of the deck array
                var randomCardPosition = Int.random(in: 0...deck.cards.count - 1)
                
                // Add to the player's hand
                player1.cards.append(deck.cards[randomCardPosition])
                
                // Remove the card from the deck
                deck.cards.remove(at: randomCardPosition)
                
                //picking the card position for player2
                randomCardPosition = Int.random(in: 0...deck.rank.count - 1)
                
                //adds to the player2's hand
                player2.cards.append(deck.cards[randomCardPosition])
                
                // Remove the card from the deck
                deck.cards.remove(at: randomCardPosition)
            }
            
            
            // Function to compare the final value of player1&2
            func compareValue() {
                if player1.rank.count > player2.rank.count {
                    print("Player 1 wins!")
                } else if player2.rank.count > player1.rank.count {
                    print("Player 2 wins!")
                } else {
                    print("It's a tie!")
                }
            }
            
            
            if integerGiven == 1 {
                compareValue()
                print("Now is other player's turn to draw.")
                continue
            }
            
            if integerGiven == 0 {
                print("Game process will now stop. Thank you for playing BlackJack.")
                break
            }
            
            
            
            
        }
        
        
        
        
        //not finished yet
        func reportStats() {
            print()
        }
        
        
        //determine the winner for the round, display score
        
        //repeat until one player wins 10 rounds
        
    }
    
    
    // example
}


let aGame = BlackJack()

