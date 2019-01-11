//
//  MagicCard.swift
//  MagicCardsAndPokemonCards
//
//  Created by Manny Yusuf on 1/9/19.
//  Copyright © 2019 Manny Yusuf. All rights reserved.
//

import Foundation



struct MagicCard: Codable {
    
    struct BoxOfMagicCards: Codable {
        let cards: [MagicCard]
    }
    
    let name: String
    let text: String
    let imageUrl: URL?
    
    struct Language: Codable {
        let name: String
        let text: String
        let imageUrl: URL
        let language: String
    }
    let foreignNames: [Language]
}
