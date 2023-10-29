//
//  ViewController.swift
//  Concentration
//
//  Created by Yuming Huo on 26/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfcards)
    
    var numberOfPairsOfcards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private(set)var flipCount = 0 {
        didSet{
            flipCountLable.text = "Flips:\(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLable: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("card is not in cardButton")
        }
        
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.IsMatched ? UIColor.clear : UIColor.orange
            }
        }
    }

    
//    private var emojiChoices = ["🎃","👻","🍭","😈","🦇","😨","🍎","🍬","😱"]
    private var emojiChoices = "🎃👻🍭😈🦇😨🍎🍬😱"

    private var emoji = [Card: String] ()

    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
            }
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else {
            return 0
        }
    }
}
