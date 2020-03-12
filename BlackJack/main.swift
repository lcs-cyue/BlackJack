//
//  main.swift
//  BlackJack
//
//  Created by Yue, Chelsea on 2020/3/11.
//  Copyright © 2020 Chelsea Yue. All rights reserved.
//

import Foundation

class BlackJack {
    
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
    }
    
    // The deck of cards
    var deck : Deck
    
    // The hands for each player
    var player1 : Hand
    var player2 : Hand
    var offence : Hand
    var defence : Hand
    
    // The pile
    var pile : Hand
    
    
    
    
    
}
