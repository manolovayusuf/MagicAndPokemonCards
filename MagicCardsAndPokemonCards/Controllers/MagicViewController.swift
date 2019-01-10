//
//  ViewController.swift
//  MagicCardsAndPokemonCards
//
//  Created by Manny Yusuf on 1/9/19.
//  Copyright © 2019 Manny Yusuf. All rights reserved.
//

import UIKit

class MagicViewController: UIViewController {
    
    @IBOutlet weak var magicCollectionView: UICollectionView!
    
    var allMagicCards = [MagicCard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        magicCollectionView.dataSource = self
        magicCollectionView.delegate = self
        
        MagicAPIClient.getAllMagicCards { (appError, magicCards) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let magicCards = magicCards {
                self.allMagicCards = magicCards
                //dump(self.allMagicCards)
            }
        }
    }
}

extension MagicViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = magicCollectionView.dequeueReusableCell(withReuseIdentifier: "MagicCell", for: indexPath)
        return cell
    }
}

extension MagicViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 400, height: 400)
    }
}
