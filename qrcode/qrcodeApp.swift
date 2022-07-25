//
//  qrcodeApp.swift
//  qrcode
//
//  Created by 房泽远 on 2022/7/19.
//

import SwiftUI

@main
struct qrcodeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel : game)
        }
    }
}
