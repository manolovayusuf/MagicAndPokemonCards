//
//  MagicDetailViewController.swift
//  MagicCardsAndPokemonCards
//
//  Created by Manny Yusuf on 1/9/19.
//  Copyright © 2019 Manny Yusuf. All rights reserved.
//

import UIKit

class MagicDetailViewController: UIViewController {
    
  
    @IBOutlet weak var detailMagicCollectionView: UICollectionView!
    var magicCard: MagicCard!
    lazy var languages = magicCard.foreignNames
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailMagicCollectionView.dataSource = self
        detailMagicCollectionView.delegate = self
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension MagicDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return languages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = detailMagicCollectionView.dequeueReusableCell(withReuseIdentifier: "MagicDetailCell", for: indexPath) as? MagicDetailCell else { fatalError("MagicDetailCell Not Found!") }
        
        cell.configureCell(magicCard: <#T##MagicCard#>)
        return cell
    }
}

extension MagicDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 300, height: 500)
    }
}
