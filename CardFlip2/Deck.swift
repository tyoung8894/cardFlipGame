//
//  Deck.swift
//  CardFlip2
//
//  Created by Joel Hollingsworth on 9/21/16.
//  Copyright © 2016 Joel Hollingsworth. All rights reserved.
//

import Foundation
import UIKit

/**
 * Card: a single playing card
 */
class Card {
    var value: String
    var suit: String
    
    
    var cardStatus: String
    var frontImage: UIImage
    var backImage = #imageLiteral(resourceName: "back")
    var text: String
    
    init(_ value: String, _ suit: String) {
        self.value = value
        self.suit = suit
        self.cardStatus = "notShowing"
        self.frontImage = UIImage(named: "\(value)_\(suit)")!
        self.text = "\(value) of \(suit)"
    }
    
    func getImage() -> UIImage {
        if cardStatus == "Showing"{
       
            
            return frontImage
        }
        if cardStatus == "Transparent"{
            frontImage.draw(at: CGPoint.zero, blendMode: .normal, alpha: 34)
            return frontImage
        }
        else{
            return backImage
        }
    }
    
    func getOpacity() -> CGFloat{
        if cardStatus == "Showing"{
            
            
            return 1
        }
        if cardStatus == "Transparent"{
           
            return 0.5
        }
        else{
            return 1
        }
    
    }
}


/*
 * values, suits: all possible combinations of suit/value
 */
let values = ["two", "three", "four", "five", "six",
              "seven", "eight", "nine", "ten", "jack",
              "queen", "king", "ace"]

let suits = ["clubs", "diamonds", "hearts", "spades"]


/**
 * Deck: a 52-card deck of playing cards
 */
class Deck {
    
    var deck: [Card] = []
    var inUse: [Bool] = []
    
    init() {
        // create all of the cards
        for suit in suits {
            for value in values {
                deck.append(Card(value, suit))
                inUse.append(false)
            }
        }
    }
    
    // randomly draw a card from the deck -- unique card
    func drawRandomCard() -> Card {
        var which = 0
        
        repeat {
            which = Int(arc4random_uniform(UInt32(deck.count)))
        } while inUse[which]
        
        inUse[which] = true
        return deck[which]
    }
}
