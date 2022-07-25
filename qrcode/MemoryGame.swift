//
//  MemoryGame.swift
//  qrcode
//
//  Created by 房泽远 on 2022/7/25.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    
    // private set 使得外部可以看到 但是不能touch

    private (set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}), !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
            indexOfTheOneAndOnlyFaceUpCard = nil
        }else{
            for index in cards.indices{
                cards[index].isFaceUp = false
            }
            indexOfTheOneAndOnlyFaceUpCard = chosenIndex
        }
            cards[chosenIndex].isFaceUp.toggle()
        }
            print("\(cards) ")
    }
    func index(of card: Card) ->Int?{
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }
    init(numberofPairsOfcards: Int, createCardContent:(Int)-> CardContent){
        cards = Array<Card>()
        //add numberofPairsofCard x 2 cards to cards array
        for pairIndex in 0..<numberofPairsOfcards{
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content,id :pairIndex*2))
            cards.append(Card(content: content,id :pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id :Int
    }
}
