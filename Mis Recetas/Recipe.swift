//
//  Recipe.swift
//  Mis Recetas
//
//  Created by Luisa Fernanda Arango Valencia on 3/08/17.
//  Copyright © 2017 Luisa Fernanda Arango Valencia. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    
    var name : String!
    var image : UIImage!
    var time : Int!
    var ingredients: [String]!
    var steps : [String]!
    var rating: String =  "good"
    
    init(name: String, image: UIImage, time: Int, ingredients : [String], steps : [String]){
        self.name =  name
        self.image =  image
        self.time =  time
        self.ingredients = ingredients
        self.steps = steps
    }
}
