//
//  GameTheme.swift
//  qrcode
//
//  Created by 房泽远 on 2022/7/26.
//  This is part of Model


import Foundation


struct GameTheme{
    
   // private (set) var themes: Array<Theme>
    static var emojiset1 = [   "⚽️","🏀","🏈","⚾️","🥎"]
    static var emojiset2 = [ "🎾","🏐","🏉","🥏","🎱","🪀"]
    static var emojiset3 = ["🏓","🏸","🏒","🏑"]
    static var emojiset4 = ["🥍","🪁","🏏","🪃","🥅","⛳️","🏋🏼‍♂️","🤾","🚴‍♀️"]
    static var emojiset5 = ["🐒","🐷","🪰","🐠","🐙","🦐"]
    static var emojiset6 = ["🍎","🍟","🍕","🥟","🦪","🍔"]
    
    init(name: String = "Balls Easy"){
        self.name = name
     //   self.numberOfPairsOfCards = numberOfPairsOfCards
     //   self.color = color
        switch self.name{

        case "Balls Normal":
            self.emojis = GameTheme.emojiset1
            self.numberOfPairsOfCards = 4
            self.color = "red"
        
        case "Balls Hard":
            self.emojis = GameTheme.emojiset2
            self.numberOfPairsOfCards = 6
            self.color = "orange"
        
        case "Balls Easy":
            self.emojis = GameTheme.emojiset3
            self.numberOfPairsOfCards = 4
            self.color = "gray"
        
        case "Sports":
            self.emojis = GameTheme.emojiset4
            self.numberOfPairsOfCards = 6
            self.color = "blue"
        
        case "Animals":
            self.emojis = GameTheme.emojiset5
            self.numberOfPairsOfCards = 5
            self.color = "purple"
        
        case "Foods":
            self.emojis = GameTheme.emojiset6
            self.numberOfPairsOfCards = 6
            self.color = "yellow"
        default :
            self.emojis = GameTheme.emojiset1
            self.numberOfPairsOfCards = 5
            self.color = "red"
        }
        if (self.numberOfPairsOfCards/2) > emojis.count{
            self.numberOfPairsOfCards = emojis.count
        }else{
            self.emojis = self.emojis.shuffled()
        }
            
        
    }
    var name: String
    var numberOfPairsOfCards: Int
    private(set) var color: String
    var emojis: Array<String>
    
}
