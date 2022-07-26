//
//  MemoryGame.swift
//  qrcode
//
//  Created by 房泽远 on 2022/7/25.
// MARK: -INTRO(S)
// This is part of Model
// Do no modify for now

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    
    // private set 使得外部可以看到 但是不能touch

    private (set) var cards: Array<Card>
    
    private(set) var score = 0
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}), !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
           // 如果目前 有且只有一张朝上的卡
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                // 成功匹配
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
                score  += 2
                }else{
                //如股没有成功匹配 检查卡片是否被看到过
                    if cards[chosenIndex].isSeen {score -= 1}
                    if cards[potentialMatchIndex].isSeen {score -= 1}
                    cards[chosenIndex].isSeen = true
                    cards[potentialMatchIndex].isSeen = true
                }
            indexOfTheOneAndOnlyFaceUpCard = nil
        }
            // 其他情况 不止一张卡 或者没有卡 朝上
            else{
            
            // 选一张卡
            for index in cards.indices{
                cards[index].isFaceUp = false
            }
            indexOfTheOneAndOnlyFaceUpCard = chosenIndex
        }
            cards[chosenIndex].isFaceUp.toggle()

        }
            print("\(cards) ")
    }
 
    init(numberofPairsOfcards: Int, createCardContent:(Int)-> CardContent){
        cards = Array<Card>()
        //add numberofPairsofCard x 2 cards to cards array
        for pairIndex in 0..<numberofPairsOfcards{
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content,id :pairIndex*2))
            cards.append(Card(content: content,id :pairIndex*2+1))
        }
        //  打乱顺序
        cards = cards.shuffled()
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id :Int
        var isSeen:Bool = false
    }
    
    // Abandoned
    func index(of card: Card) ->Int?{
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }
}
