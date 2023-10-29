//
//  ViewController.swift
//  Concentration
//
//  Created by Yuming Huo on 26/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfcards)
    
    var numberOfPairsOfcards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    var flipCount = 0 {
        didSet{
            flipCountLable.text = "Flips:\(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLable: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("card is not in cardButton")
        }
        
    }
    
    func updateViewFromModel() {
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

    
    var emojiChoices = ["🎃","👻","🍭","😈","🦇","😨","🍎","🍬","😱"]
    
    var emoji = [Int: String] ()

    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        
        return emoji[card.identifier] ?? "?"
    }
    
}
