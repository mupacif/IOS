//
//  Util.swift
//  16_JSONWHEDUFINTHIS
//
//  Created by etudiant on 07/06/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class Util: NSObject {
    
    static func  jsonfier(_ object_a_jsonifier:[String:Any])->String
    {
        //obtenir les bits à partir de l'objet
        do
        {
        let jsonData = try! JSONSerialization.data(withJSONObject: object_a_jsonifier, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            return String(data: jsonData, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        }catch let erreur
        {
            print("erreur :"+erreur.localizedDescription)
            return ""
        }
        
    }
}
