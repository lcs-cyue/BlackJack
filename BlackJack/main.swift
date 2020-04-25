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
    var yourTurn : Hand
    //    var newCard : Hand
    var player1score = 0
    var player2score = 0
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
        
        
        // Set yourTurn hand
        yourTurn = Hand(description: "yourTurn")
        
        
        
        // Game is about to start
        print("==========")
        print("START GAME")
        print("==========\n")
        
        print("It's Player1's turn to draw")
        
        play()
        
        
    }
    
    
    
    
    
    func switchTurn() {
        print("\nSwitching turn...")
        
        if yourTurn === player1 {
            print("\nSwitching turn to Player 2")
            yourTurn = player2
        } else {
            print("\nSwitching turn to Player 1")
            yourTurn = player1
        }
    }
    
    
    
    private func play() {
        
        yourTurn = player1
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
                if player1.rank.count >= 21 {
                    print("you are doomed")
                }
                
                if player2.rank.count >= 21 {
                    print("you are doomed")
                }
            }
            
            // Function to check if the value is greater than 17
            func check17() {
                //display a warning message if the value surpasses 17
                if player1.rank.count >= 17 && player1.rank.count < 21 {
                    print("Your total card value is over 17. Do you still want to continue drawing?")
                }
                
                if player2.rank.count >= 17 && player2.rank.count < 21 {
                    print("Your total card value is over 17. Do you still want to continue drawing?")
                }
            }
            
            
            //report how many rounds each player has won after each round
            func reportStats() {
                if yourTurn === player2 {
                    print("player 1 has won \(player1score) rounds so far")
                    print("player 2 has won \(player2score) rounds so far")
                }
            }
            
            
            
            
            func appendCard() {
                // Get a random value between 0 and the end of the deck array
                var randomCardPosition = Int.random(in: 0...deck.cards.count - 1)
                
                // Add to the player's hand
                yourTurn.cards.append(deck.cards[randomCardPosition])
                
                // Remove the card from the deck
                deck.cards.remove(at: randomCardPosition)
                
                //picking the card position for player2
                //                randomCardPosition = Int.random(in: 0...deck.rank.count - 1)
                
                //adds to the player2's hand
                //                offence.cards.append(deck.cards[randomCardPosition])
                
                // Remove the card from the deck
                //                deck.cards.remove(at: randomCardPosition)
            }
            
            //If the integer given does not equal to 1, continue drawing
            guard integerGiven <= 1 else {
                
                appendCard()
                print("Now you have \(yourTurn.cards) ")
                // Integer not in desired range, return to top and ask again
                check21()
                check17()
                continue
                
            }
            
            
            
            
            // Function to compare the final value of player1&2
            func compareValue() {
                if player1.rank.count > player2.rank.count {
                    print("Player 1 wins!")
                    player1score += 1
                } else if player2.rank.count > player1.rank.count {
                    print("Player 2 wins!")
                    player2score += 1
                } else if player1.rank.count == player2.rank.count{
                    print("It's a tie!")
                }
            }
            
            
            //If the integer given equals to 1, switch to the other player
            if integerGiven == 1 {
                
                compareValue()
                reportStats()
                switchTurn()
                
                print("Now is other player's turn to draw.")
                continue
            }
            
            if integerGiven == 0 {
                print("Game process will now stop. Thank you for playing BlackJack.")
                break
            }
            
            
            
            
        }
        
        
        
        
        
        
        //determine the winner for the round, display score
        
        //repeat until one player wins 10 rounds
        
    }
    
    
    // example
}


let aGame = BlackJack()

