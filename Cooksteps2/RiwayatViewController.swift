//
//  HistoryViewController.swift
//  Cooksteps2
//
//  Created by Cyntya Rahma Dita on 06/04/22.
//

import UIKit

class RiwayatViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var riwayatUITableView: UITableView!
    
    struct Sunset {
        let title: String
        let imageName: String
        let subtitle: String
    }
    
    let data: [Sunset] = [
        Sunset(title: "Nasi Goreng", imageName: "nasgor", subtitle: "Nasi goreng"),
        Sunset(title: "Mie Goreng", imageName: "migor", subtitle: "Nasi goreng"),
        Sunset(title: "Ayam Goreng", imageName: "ayamgor", subtitle: "Nasi goreng"),
        Sunset(title: "Tumis Kangkung", imageName: "kangkung", subtitle: "Nasi goreng"),
        Sunset(title: "Tumis Kacang Panjang", imageName: "kacang", subtitle: "Nasi goreng"),
        Sunset(title: "Omelete", imageName: "omelete", subtitle: "Nasi goreng"),
        Sunset(title: "Sate", imageName: "sate", subtitle: "Nasi goreng"),
        Sunset(title: "Soto", imageName: "soto", subtitle: "Nasi goreng")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Riwayat"
        
        riwayatUITableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sunset = data[indexPath.row]
        let cell = riwayatUITableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RiwayatTableViewCell
        
        cell.title.text = sunset.title
        cell.iconImageView.image = UIImage(named: sunset.imageName)
        cell.subtitle.text = sunset.subtitle
        
        return cell
    }

}
