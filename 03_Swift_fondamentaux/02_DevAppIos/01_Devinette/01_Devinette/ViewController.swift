//
//  ViewController.swift
//  01_Devinette
//
//  Created by etudiant on 10/05/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pixelInfo: UIView!
    @IBOutlet weak var etqDisplay: UILabel!
    @IBOutlet weak var txtSaisie: UITextField!
    
    
    var score:Int = 0
    //générer une valeur aléatoire entre 0 et 4
    //(5 sera la 1er valeur qui ne sera pas générée)
    var valeur_a_deviner : UInt32 = 0
    @IBOutlet weak var etqScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        etqScore?.text = String(score)
        valeur_a_deviner = tirerValeurAléatoire()
        print(valeur_a_deviner)
         pixelInfo.backgroundColor = tb[Int(valeur_a_deviner)]

    }

    @IBAction func btnTesterTouched(_ sender: UIButton) {
      
        let saisie = txtSaisie.text
        
        
        if saisie == String(valeur_a_deviner)
        {
            etqDisplay.text = "Réponse correcte"
            etqDisplay.textColor = .green
            
            score += 1
            valeur_a_deviner = tirerValeurAléatoire()

        }else{
            etqDisplay.text = "Réponse erronée"
            etqDisplay.textColor = .red
            score -= 1
            score = score > 0 ? score : 0
        }
        txtSaisie.text=""
          etqScore?.text = String(score)
    }
    
    var tb: [UIColor] = [.white,.yellow,.green,.blue,.red]
    func tirerValeurAléatoire()->UInt32
    {
        let v = arc4random_uniform(5)
        pixelInfo.backgroundColor = tb[Int(v)]
        return v
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

