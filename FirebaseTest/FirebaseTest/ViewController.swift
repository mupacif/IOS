//
//  ViewController.swift
//  FirebaseTest
//
//  Created by etudiant on 02/06/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func btnConnectTouched(_ sender: Any) {
       succes(self.txtLogin.text!, self.txtPassword.text!)
    }
    @IBOutlet weak var btnConnectTouched: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
        @IBOutlet weak var txtLogin: UITextField!
    @IBOutlet weak var txtDisplay: UITextView!

    @IBAction func btnRegisterTouched(_ sender: UIButton) {
        
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
         performSegue(withIdentifier: "toHome", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

