//
//  card.swift
//  Concentration
//
//  Created by Yuming Huo on 27/10/2023.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var IsMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
        }
    
    init(identifier: Int) {
        self.identifier = identifier
    }
    
}
