//
//  ViewController.swift
//  Explorer
//
//  Created by etudiant on 01/06/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnConnectTouched(_ sender: UIButton) {
      //  let name = login.text
    //    let pass = password.text
        
       // print("name:\(name),password:\(pass)")
        
    }

   
    @IBAction func btnSignupTouched(_ sender: Any) {
    }
}

