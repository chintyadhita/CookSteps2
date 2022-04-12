//
//  Food.swift
//  Cooksteps2
//
//  Created by Cyntya Rahma Dita on 10/04/22.
//

import Foundation

class Food
{
    var id: String!
    var title: String!
    var subtitle: String!
    var imageName: String!
    
    public init(id: String, title: String, imageName: String, subtitle: String){
        self.id = id
        self.title = title
        self.imageName = imageName
        self.subtitle = subtitle
    }
}
