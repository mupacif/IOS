//
//  ViewController.swift
//  Explorer
//
//  Created by etudiant on 07/06/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var txtDisplay: UITextView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtLogin: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func signUpTouched(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: txtLogin.text!, password: txtPassword.text!) { (user, error) in
            if error != nil
            {
                print("Error: \(error!.localizedDescription)" )
                self.txtDisplay.text = error!.localizedDescription
            }else{
                
                self.succes(self.txtLogin.text!, self.txtPassword.text!)
                
            }
            
        }

    }

    @IBAction func signInTouched(_ sender: UIButton) {
        var email = txtLogin.text!
        var password = txtPassword.text!
        
        succes(email, password);
    }
        func succes(_ email:String,_ password:String)
        {
            
        self.txtPassword.text = ""
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error == nil
            {
                self.goToHome()
            }else
            {
                self.txtDisplay.text = error!.localizedDescription
            }
        }
        
    }
    
    
    func goToHome()  {
        performSegue(withIdentifier: "goToHome", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

