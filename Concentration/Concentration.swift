//
//  Concentration.swift
//  Concentration
//
//  Created by Yuming Huo on 28/10/2023.
//

import Foundation

class Concentration {
    private(set) var cards = [Card]()
    
    private var indexOdOneAndOnlyFaceUpCard: Int? {
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
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
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
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        for identifier in 1...numberOfPairsOfCards {
            let card = Card(identifier: identifier)
            cards += [card, card]
        }
    }
}
