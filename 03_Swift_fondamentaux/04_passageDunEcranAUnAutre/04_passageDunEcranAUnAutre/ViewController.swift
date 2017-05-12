//
//  ViewController.swift
//  04_passageDunEcranAUnAutre
//
//  Created by etudiant on 11/05/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnDestinationSansSegueTouched(_ sender: UIButton)
    {
        let destinationDunEcran = storyboard?.instantiateViewController(withIdentifier: "idDestinationSansSegue") as! DestinationSansSegueViewController
        
        //afficher ce controleur
        //champ storyBoad ID affiché par l'assistant
        // d'identification
        present(destinationDunEcran, animated: true, completion: nil)
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

