//
//  Cellule.swift
//  TestListe
//
//  Created by etudiant on 06/06/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class Cellule: UITableViewCell {

 
    var itamValue : String = ""
    
    @IBOutlet weak var txtItem: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
