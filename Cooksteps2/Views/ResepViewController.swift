//
//  ResepViewController.swift
//  Cooksteps2
//
//  Created by Cyntya Rahma Dita on 06/04/22.
//

import UIKit

class ResepViewController: UIViewController {
    
    @IBOutlet weak var sebelumnyaCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "1", title: "Nasi Goreng", subtitle: "Nasi, Bakso, Minyak", image: "nasgor"),
        .init(id: "2", title: "Mie Goreng", subtitle: "Mie, Bakso, Ayam", image: "migor"),
        .init(id: "3", title: "Sate", subtitle: "Ayam, Kacang, Kecap", image: "sate"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    private func registerCells() {
        sebelumnyaCollectionView.register(UINib(nibName: SebelumnyaCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SebelumnyaCollectionViewCell.identifier)
    }
}

extension ResepViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SebelumnyaCollectionViewCell.identifier, for: indexPath) as! SebelumnyaCollectionViewCell
        
        cell.setup(category: categories[indexPath.row])
        
        return cell
    }
}
