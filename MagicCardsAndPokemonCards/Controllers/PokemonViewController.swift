//
//  PokemonViewController.swift
//  MagicCardsAndPokemonCards
//
//  Created by Manny Yusuf on 1/9/19.
//  Copyright © 2019 Manny Yusuf. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    var pokemonCardArray = [PokemonCard]() {
        didSet {
            DispatchQueue.main.async {
                self.pokemonCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonCollectionView.dataSource = self
        pokemonCollectionView.delegate = self
        
        PokemonAPIClient.getAllPokemonCards { (appError, pokemonCards) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let pokemonCards = pokemonCards {
                self.pokemonCardArray = pokemonCards
                //dump(self.pokemonCardArray)
            }
        }
    }
}

extension PokemonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonCardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = pokemonCollectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as? PokemonCell else { fatalError("PokemonCell not found") }
        let pokemonCards = pokemonCardArray[indexPath.row]
        
        if let pokemonImageURL = pokemonCards.imageUrl {
            if let pokemonImage = ImageHelper.shared.image(forKey: pokemonImageURL.absoluteString as NSString) {
                cell.pokemonCardImage.image = pokemonImage
            } else {
                cell.pokemonIndicator.startAnimating()
                ImageHelper.shared.fetchImage(urlString: pokemonImageURL.absoluteString) { (appError, image) in
                    if let appError = appError {
                        print(appError.errorMessage())
                    } else if let image = image {
                        cell.pokemonCardImage.image = image
                    }
                    cell.pokemonIndicator.stopAnimating()
                }
            }
        }
        return cell
    }
}

extension PokemonViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 250/2, height: 350/2)
    }
}

extension PokemonViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let detailViewController = mainStoryboard.instantiateViewController(withIdentifier: "PokemonDetail") as? PokemonDetailViewController else { return }
        detailViewController.modalPresentationStyle = .overCurrentContext
        present(detailViewController, animated: true, completion: nil)
    }
}
