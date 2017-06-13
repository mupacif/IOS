//
//  ExplorerItem.swift
//  Explorer
//
//  Created by Etudiant on 13/06/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class ExplorerItem: NSObject {
    var name    : String?
    var phone   : String?
    var lat : Double?
    var lng : Double?
    
    init(name : String, phone : String, lat : Double, lng : Double) {
        
        self.name = name
        self.phone = phone
        self.lat = lat
        self.lng = lng
    }
}
