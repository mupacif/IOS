//
//  DestinationSansSegueViewController.swift
//  04_passageDunEcranAUnAutre
//
//  Created by etudiant on 11/05/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class DestinationSansSegueViewController: UIViewController {
    var textRecu : String = ""
    @IBOutlet weak var txtSaisie: UITextField!
    var ecran1: ViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtSaisie.text = textRecu
    }

    @IBAction func btnRetourTouched(_ sender: Any)
    {
        ecran1!.donneesTransferee = txtSaisie.text!
        dismiss(animated: true){print("la page 3 a été fermée")}
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
