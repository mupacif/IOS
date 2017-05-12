//
//  ViewController.swift
//  PlusieursBtns
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

    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    
    @IBAction func btnTouched(_ sender: UIButton) {
        if sender == btn1
        {
        print("click btn1")
        }
        if sender == btn2
        {
            print("click btn2")
        }
        if (sender.title(for: UIControlState.normal) == "Button3")
        {
            print("click btn3")
        }
        if (sender.tag == 4)
        {
            print("click btn4")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

