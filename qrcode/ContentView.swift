//
//  ContentView.swift
//  qrcode
//
//  Created by 房泽远 on 2022/7/19.
//

// This is part of View

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
    
        VStack{
            Text("当前主题:    " + viewModel.theme.name)
            Text("积分：" + String(viewModel.model.score))
            ScrollView{
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
        
                    ForEach(viewModel.cards){
                    card in CardView(card:card)
                            .aspectRatio(2/3,contentMode: .fit)
                            .onTapGesture{
                                viewModel.choose(card)
                            }
                }
            }
            .foregroundColor(viewModel.color)
            //.foregroundColor(.red)
        
        }
        .padding(.horizontal)
            Spacer()
            Button( "New Game",action: viewModel.newGame)
        }
    }
}

    
    struct CardView: View{
        let card: MemoryGame<String>.Card
        
        var body: some View{
            ZStack{
                let shape = RoundedRectangle(cornerRadius: 20)
                if card.isFaceUp{
                    shape.fill().foregroundColor(.white)
                    shape .strokeBorder(lineWidth: 3)
                    Text(card.content).font(.largeTitle)
                    
                }else if card.isMatched{
                    shape.opacity(0)
                }
                else{
             
                    shape.fill()
                   // shape.overlay(Image("bg").resizable().aspectRatio(contentMode: .fill).frame(width: 85,alignment: .center).clipped())
                   // Image("bg").resizable().aspectRatio(contentMode: .fill) .scaledToFill().clipShape(RoundedRectangle(cornerRadius: 20
                                                                    //))
                                                                                                   //.shadow(radius: 9)
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
