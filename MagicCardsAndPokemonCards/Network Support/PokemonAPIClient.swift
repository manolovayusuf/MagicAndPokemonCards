//
//  PokemonAPIClient.swift
//  MagicCardsAndPokemonCards
//
//  Created by Manny Yusuf on 1/9/19.
//  Copyright © 2019 Manny Yusuf. All rights reserved.
//

import Foundation

final class PokemonAPIClient {
    public static func getAllPokemonCards(completionHandler: @escaping (AppError?, [PokemonCard]?) -> Void) {
        let urlString = "https://api.pokemontcg.io/v1/cards?contains=imageUrl,imageUrlHiRes,attacks"
        
        NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(appError, nil)
            } else if let data = data {
                do {
                    let pokemonCards = try JSONDecoder().decode(AllPokemonCards.self, from: data).cards
                    completionHandler(nil, pokemonCards)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
}
