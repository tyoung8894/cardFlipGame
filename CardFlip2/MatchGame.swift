//
//  MatchGame.swift
//  CardFlip2
//
//  Created by Sean Webber and Tyler Young on 9/26/16.
//  Copyright © 2016 Joel Hollingsworth. All rights reserved.
//

import UIKit

/**
 * This is the Model for the Match Game.
 */
class MatchGame {
    
    let deck = Deck()
    var flips = 0
    var score = 0
    var message = "Welcome!"
    var count = 0
    var previous = -1
    
    var matrix: [Card] = []
    var whichValue: String = ""
    var previousValue: String = ""
    var whichSuit: String = ""
    var previousSuit: String = ""
    var previousSuitTwo: String = ""
    
    
    init() {
        // draw 16 random cards
        for _ in 1...16 {
            matrix.append(deck.drawRandomCard())
        }
    }
    
    /*
     * Called when a card is tapped.
     */
    func flipCardUp(_ which: Int) {
        
        // only need to do something if card is facing down
        if matrix[which].cardStatus == "notShowing" {
            
            // flip up
            matrix[which].cardStatus = "Showing"
            
            // update values/text
            flips += 1
            score -= 1
            message = matrix[which].text
            whichSuit = matrix[which].suit
            whichValue = matrix[which].value
            
            print(previous)
            if (previous != -1) {
                
                if(previousValue == whichValue){
                    count+=1
                    score += 17
                    message = "Match on value \(matrix[which].value)! Streak: \(count)!"
                    matrix[which].cardStatus = "Transparent"
                    matrix[previous].cardStatus = "Transparent"
                    
                    previous = -1
                    print("Should be transparent", previous)                }
                
                else if(previousSuit == whichSuit){
                    count+=1
                    score += 5
                    message = "Match on suit \(matrix[which].suit)! Streak: \(count)!"
                    matrix[which].cardStatus = "Transparent"
                    matrix[previous].cardStatus = "Transparent"
                    previous = -1
                    print("Should be transparent", previous)                  }
                else{
                    count = 0;
                    print(previousSuit, whichSuit)
                    matrix[previous].cardStatus = "notShowing"
                    message = "boo hoo, try again "
                    previous = which
                    previousSuit = matrix[which].suit
                    previousValue = matrix[which].value
                    print("Should be notshowing", previous)
                    
                }
                
                // ???logic for matching???
                
                // flip over the previous card
               
            }
            else{
                previous = which
                previousSuit = matrix[which].suit
                previousValue = matrix[which].value
            }
   
      
        }
        
    
    }

    
    /*
     * Return the current image for a particular Card
     */
    func getImage(_ which: Int) -> UIImage {
        return matrix[which].getImage()
    }
    func getOpacity(_ which: Int) -> CGFloat{
        return matrix[which].getOpacity()
    }
   
 
}
