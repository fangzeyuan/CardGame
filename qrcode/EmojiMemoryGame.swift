//
//  EmojiMemoryGame.swift
//  qrcode
//
//  Created by 房泽远 on 2022/7/25.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject{
    
    static let emojis = [   "⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🪀","🏓","🏸","🏒","🏑","🥍","🪁","🏏","🪃","🥅","⛳️","🏋🏼‍♂️","🤾","🚴‍♀️"]
    
    static func createMemorygame() -> MemoryGame<String>{
        MemoryGame<String>(numberofPairsOfcards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }

    @Published private var model: MemoryGame<String> = createMemorygame()
       
   
    // Copy 
    var cards : Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: -Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
