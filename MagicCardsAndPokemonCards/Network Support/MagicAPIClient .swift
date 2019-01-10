//
//  MagicAPIClient .swift
//  MagicCardsAndPokemonCards
//
//  Created by Manny Yusuf on 1/9/19.
//  Copyright © 2019 Manny Yusuf. All rights reserved.
//

import Foundation

final class MagicAPIClient {
    public static func getAllMagicCards(completionHandler: @escaping (AppError?, [MagicCard]?) -> Void) {
        let urlString = "https://api.magicthegathering.io/v1/cards?contains=imageUrl"
        
        NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(appError, nil)
            } else if let data = data {
                do {
                    let magicCards = try JSONDecoder().decode(MagicCard.BoxOfMagicCards.self, from: data).cards
                    completionHandler(nil, magicCards)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
}
