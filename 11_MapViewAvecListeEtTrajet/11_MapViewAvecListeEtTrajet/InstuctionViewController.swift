//
//  InstuctionViewController.swift
//  11_MapViewAvecListeEtTrajet
//
//  Created by etudiant on 6/1/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class InstuctionViewController: UIViewController {

    @IBOutlet weak var txtInformation: UITextView!
    
    var tbInformations:[String] = []
    
    override func viewDidLoad() {
   
        super.viewDidLoad()
            var txt = ""
        
        //concaténer tous les iteùs (les informations du trajet)
        //contenus dans le tableau tbInformations et les séparer 
        //par un passage à la ligne
        
        for item in tbInformations
        {
            txt += "\n" + item
        }
        
        txtInformation.text = txt
    }
     @IBAction func btnRetourTouched(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
