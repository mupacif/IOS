//
//  Ecran3ViewController.swift
//  04_passageDunEcranAUnAutre
//
//  Created by etudiant on 11/05/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class Ecran3ViewController: UIViewController {

    @IBOutlet weak var txtSaisie: UITextField!
    var donnéesRecu : String = ""
    var donnee_a_transferer : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        txtSaisie.text = donnéesRecu
    }

    @IBAction func btnRetourTouched(_ sender: Any) {
        donnee_a_transferer = txtSaisie.text!
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
    func rendreDonneesSaisies()->String
    {
        return txtSaisie.text!
    }


}
