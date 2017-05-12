//
//  ViewController.swift
//  04_passageDunEcranAUnAutre
//
//  Created by etudiant on 11/05/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtSaisie: UITextField!
    var donneesTransferee: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        txtSaisie.text = donneesTransferee
    }
    @IBAction func btnDestinationSansSegueTouched(_ sender: UIButton)
    {
        let destinationDunEcran = storyboard?.instantiateViewController(withIdentifier: "idDestinationSansSegue") as! DestinationSansSegueViewController
        
        destinationDunEcran.textRecu = txtSaisie.text!
        
        //et injecter l'ecran de retour
        destinationDunEcran.ecran1 = self
        //afficher ce controleur
        //champ storyBoad ID affiché par l'assistant
        // d'identification
        present(destinationDunEcran, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
         let destinataire = segue.destination
        if destinataire is Ecran2ViewController
        {
            let dest = destinataire as! Ecran2ViewController
            dest.texteRecu = txtSaisie.text!
            dest.ecran1 = self
        }
        
        if destinataire is Ecran3ViewController
        {
            let dest = destinataire as! Ecran3ViewController
            dest.donnéesRecu = txtSaisie.text!

        }
        print("prepare for segue")
    }
    
    @IBAction func retourEcran3ToEcran1(segue: UIStoryboardSegue)
    {
        print("appel méthode Ecran3")
        let ecran3 = segue.source as! Ecran3ViewController
        
        //récupérer les donénes saisies dans l'écran 3
        //solution 1
        //utiliser une propriété exportée qui peut fournir
        //ces données
        print("Données:\(ecran3.donnee_a_transferer)")
        donneesTransferee = /*ecran3.donnee_a_transferer*/ecran3.rendreDonneesSaisies()
        
        //solution 2
        //utiliser une méthode exportée par l'ecran 3,capable de sournir les données
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

