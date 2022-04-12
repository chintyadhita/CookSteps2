//
//  SebelumnyaCollectionViewCell.swift
//  Cooksteps2
//
//  Created by Cyntya Rahma Dita on 12/04/22.
//

import UIKit

class SebelumnyaCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: SebelumnyaCollectionViewCell.self)

    @IBOutlet weak var sebelumnyaImageView: UIImageView!
    @IBOutlet weak var sebelumnyaTitle: UILabel!
    @IBOutlet weak var sebelumnyaSubtitle: UILabel!
    
    func setup(category: DishCategory){
        sebelumnyaTitle.text = category.title
        sebelumnyaSubtitle.text = category.subtitle
        sebelumnyaImageView.image = UIImage(named: category.image)
    }
    
}
