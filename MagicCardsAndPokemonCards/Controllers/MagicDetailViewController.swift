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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailMagicCollectionView.dataSource = self
        detailMagicCollectionView.delegate = self
    }

}

extension MagicDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = detailMagicCollectionView.dequeueReusableCell(withReuseIdentifier: "MagicDetailCell", for: indexPath) as? MagicDetailCell else { fatalError("MagicDetailCell Not Found!") }
        return cell
    }
}

extension MagicDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 400, height: 400)
    }
}
