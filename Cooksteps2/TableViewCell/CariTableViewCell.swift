//
//  CariTableViewCell.swift
//  Cooksteps2
//
//  Created by Cyntya Rahma Dita on 11/04/22.
//

import UIKit

class CariTableViewCell: UITableViewCell {
    
    static let identifier = "CariTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var button: UIButton!

}
