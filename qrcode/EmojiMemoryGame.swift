//
//  EmojiMemoryGame.swift
//  qrcode
//
//  Created by 房泽远 on 2022/7/25.
// This is part of ViewModel
//
import SwiftUI


class EmojiMemoryGame: ObservableObject{
    
    //private var emojis: Array<String>?
    
    //static let emojis = [   "⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🪀","🏓","🏸","🏒","🏑","🥍","🪁","🏏","🪃","🥅","⛳️","🏋🏼‍♂️","🤾","🚴‍♀️"]
    
    static let theme_list = ["Balls Normal","Balls Hard","Balls Easy","Sports","Animals","Foods"]
    
    static func createMemorygame(emojis: Array<String>, nCards: Int) -> MemoryGame<String>{
        MemoryGame<String>(numberofPairsOfcards: nCards) { pairIndex in
            emojis[pairIndex]
        }
    }

    private(set) var emojis: Array<String>
    @Published private(set) var model: MemoryGame<String>
    private(set) var theme: GameTheme
    
    init(){
        theme = GameTheme(name: "Balls Normal")
        emojis = theme.emojis
        model = EmojiMemoryGame.createMemorygame(emojis: theme.emojis,nCards: theme.numberOfPairsOfCards)
    }
   
    // Copy 
    var cards : Array<MemoryGame<String>.Card>{
        return model.cards
    }
    var color : Color{
        var myColor: Color
        switch theme.color {
            case "red":
                myColor = Color.red
            case "green":
                myColor = Color.green
            case "gray":
                myColor = Color.gray
            case "orange":
            myColor = Color.orange
            case "blue":
            myColor = Color.blue
            case "yellow":
            myColor = Color.yellow
            case "purple":
            myColor = Color.purple
        default:
            myColor = Color.red
        }
        return myColor
    }
    
    // MARK: -Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }

    func newGame(){
        //RandomElemnt return a string optional
        if let curThemeName = EmojiMemoryGame.theme_list.randomElement(){
            theme = GameTheme(name: curThemeName)
            emojis = theme.emojis
            model = EmojiMemoryGame.createMemorygame(emojis: theme.emojis,nCards: theme.numberOfPairsOfCards)
        }
       
        
        
    }
    
}






struct Previews_EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
