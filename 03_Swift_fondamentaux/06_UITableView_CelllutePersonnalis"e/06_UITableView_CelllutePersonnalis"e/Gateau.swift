//
//  Gateau.swift
//  06_UITableView_CelllutePersonnalis"e
//
//  Created by etudiant on 11/05/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation

class Gateau
{
    var nomImage: String
    var nom : String
    var description : String
    init(nom:String,nomImage:String,description:String)
    {
         self.nom = nom
        self.description = description
        self.nomImage = nomImage
    }
}
