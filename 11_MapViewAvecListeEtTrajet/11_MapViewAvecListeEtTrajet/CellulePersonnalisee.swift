//
//  CellulePersonnalisee.swift
//  11_MapViewAvecListeEtTrajet
//
//  Created by etudiant on 5/30/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class CellulePersonnalisee: UITableViewCell {

    @IBOutlet weak var etqTelephone: UILabel!
    @IBOutlet weak var etqNom: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
