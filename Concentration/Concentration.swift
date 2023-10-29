//
//  Concentration.swift
//  Concentration
//
//  Created by Yuming Huo on 28/10/2023.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOdOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].IsMatched {
            if let matchIndex = indexOdOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].IsMatched = true
                    cards[index].IsMatched = true
                }
                cards[index].isFaceUp = true
            }else {
                indexOdOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for identifier in 1...numberOfPairsOfCards {
            let card = Card(identifier: identifier)
            cards += [card, card]
        }
    }
}
