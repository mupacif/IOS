//
//  Ecran2ViewController.swift
//  04_passageDunEcranAUnAutre
//
//  Created by etudiant on 11/05/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class Ecran2ViewController: UIViewController {
    @IBOutlet weak var txtSaisie: UITextField!
    var texteRecu: String = ""
    var ecran1: ViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtSaisie.text = texteRecu

        // Do any additional setup after loading the view.
    }

    @IBAction func btnRetourTouched(_ sender: UIButton) {
        ecran1!.donneesTransferee = txtSaisie.text!
        dismiss(animated:true){print("la page 2 a été fermée")}
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
