//
//  PokemonCard.swift
//  MagicCardsAndPokemonCards
//
//  Created by Manny Yusuf on 1/9/19.
//  Copyright © 2019 Manny Yusuf. All rights reserved.
//

import Foundation

struct AllPokemonCards: Codable {
    let cards: [PokemonCard]
}

struct PokemonCard: Codable {    
    let imageUrl: URL?
    let imageUrlHiRes: URL?
    
    struct PokemonAttacks: Codable {
        let name: String
        let text: String
        let damage: String
    }
    let attacks: [PokemonAttacks]
}
