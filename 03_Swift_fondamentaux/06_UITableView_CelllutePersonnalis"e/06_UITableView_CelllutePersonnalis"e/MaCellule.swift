//
//  MaCellule.swift
//  06_UITableView_CelllutePersonnalis"e
//
//  Created by etudiant on 12/05/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class MaCellule: UITableViewCell {

    @IBOutlet weak var imageGateau: UIImageView!
    @IBOutlet weak var etqTitre: UILabel!
    @IBOutlet weak var etqDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
