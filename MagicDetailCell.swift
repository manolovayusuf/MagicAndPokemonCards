//
//  MagicDetailCell.swift
//  MagicCardsAndPokemonCards
//
//  Created by Jian Ting Li on 1/9/19.
//  Copyright © 2019 Manny Yusuf. All rights reserved.
//

import UIKit

class MagicDetailCell: UICollectionViewCell {
    @IBOutlet weak var magicImage: UIImageView!
    @IBOutlet weak var magicNameLabel: UILabel!
    @IBOutlet weak var magicLanguageLabel: UILabel!
    @IBOutlet weak var magicDescriptionTextView: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    public func configureCell(magicCard: MagicCard, foreignLanguage: MagicCard.Language?) {
        if let foreignLanguage = foreignLanguage {
            setMagicImage(url: foreignLanguage.imageUrl)
            magicNameLabel.text = foreignLanguage.name
            magicLanguageLabel.text = foreignLanguage.language
            magicDescriptionTextView.text = foreignLanguage.text
        } else {
            setMagicImage(url: magicCard.imageUrl!)
            magicNameLabel.text = magicCard.name
            magicLanguageLabel.text = "English"
            magicDescriptionTextView.text = magicCard.text
        }
    }
    
    private func setMagicImage(url: URL) {
        
        if let image = ImageHelper.shared.image(forKey: url.absoluteString as NSString){
            self.magicImage.image = image
        } else {
            activityIndicator.startAnimating()
            ImageHelper.shared.fetchImage(urlString: url.absoluteString) { (appError, image) in
                if let appError = appError {
                    print(appError.errorMessage())
                } else if let image = image {
                    self.magicImage.image = image
                }
                self.activityIndicator.stopAnimating()
            }
        }
    }
}
