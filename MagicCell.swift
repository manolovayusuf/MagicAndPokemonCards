//
//  MagicCell.swift
//  MagicCardsAndPokemonCards
//
//  Created by Jian Ting Li on 1/9/19.
//  Copyright © 2019 Manny Yusuf. All rights reserved.
//

import UIKit

class MagicCell: UICollectionViewCell {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var magicCardImage: UIImageView!
    
    public func configureCell(magicCard: MagicCard) {
        if let imageUrl = magicCard.imageUrl {
            if let image = ImageHelper.shared.image(forKey: imageUrl.absoluteString as NSString) {
                magicCardImage.image = image
            } else {
                activityIndicator.startAnimating()
                ImageHelper.shared.fetchImage(urlString: imageUrl.absoluteString) { (appError, image) in
                    if let appError = appError {
                        print(appError.errorMessage())
                    } else if let image = image {
                        self.magicCardImage.image = image
                    }
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
}
