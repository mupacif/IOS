//
//  ViewController.swift
//  clickCounter
//
//  Created by etudiant on 10/05/2017.
//  Copyright © 2017 -. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    @IBOutlet weak var countLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
  
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickedCount(_ sender: UIButton) {
        self.count += 1
        countLabel.text = String(count)
    }

}

