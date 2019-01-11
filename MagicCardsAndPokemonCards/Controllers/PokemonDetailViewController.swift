//
//  PokemonDetailViewController.swift
//  MagicCardsAndPokemonCards
//
//  Created by Manny Yusuf on 1/9/19.
//  Copyright © 2019 Manny Yusuf. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    var pokemonCardInfo: PokemonCard!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonCollectionView.dataSource = self
        pokemonCollectionView.delegate = self
    }
}

extension PokemonDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonCardInfo.attacks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = pokemonCollectionView.dequeueReusableCell(withReuseIdentifier: "PokemonDetailCell", for: indexPath) as? PokemonDetailCell else { fatalError("PokemonDetailCell not found") }
        
        //set the pokemonCardImage
        ImageHelper.shared.fetchImage(urlString: pokemonCardInfo.imageUrlHiRes!.absoluteString) { (appError, image) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let image = image {
                cell.imageOfPokemon.image = image
            }
        }
        
        cell.pokemonAttack.text = pokemonCardInfo.attacks[indexPath.row].name
        cell.pokemonDamage.text = pokemonCardInfo.attacks[indexPath.row].damage
        cell.pokemonAttackDescription.text = pokemonCardInfo.attacks[indexPath.row].text
        
        return cell
    }
}
extension PokemonDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 282, height: 280)
    }
}
