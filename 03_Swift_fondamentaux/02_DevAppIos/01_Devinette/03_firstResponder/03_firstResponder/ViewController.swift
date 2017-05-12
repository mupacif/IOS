//
//  ViewController.swift
//  03_firstResponder
//
//  Created by etudiant on 11/05/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnFocusSurTxt2(_ sender: UIButton) {
        txt2.becomeFirstResponder()
    }
   
    @IBAction func btnCacherClaviertxt2(_ sender: Any) {
        
            txt2.resignFirstResponder()
    }
    //cacher le clavier visuel lorsque j'utilise 
    //la touche return du clavier
    @IBAction func btnCacherClavierTxt1(_ sender: Any) {
        txt1.resignFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //solution 1
        //demander au controleur de terminer 
        //toutes les opérations d"édition
        
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

