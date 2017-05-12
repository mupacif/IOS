//
//  ViewController.swift
//  02_PLIST
//
//  Created by etudiant on 10/05/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var etqNom: UILabel!
    @IBOutlet weak var etqPrenom: UILabel!
    @IBOutlet weak var etqDateNaissance: UILabel!
    @IBOutlet weak var txtSalaire: UITextField!
    @IBOutlet weak var txtTelephone: UITextField!
    @IBOutlet weak var txtNbEnfant: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = Bundle.main
        let path = bundle.path(forResource: "DonneesPersonnelles", ofType: "plist")!
        
        let dico = NSMutableDictionary.init(contentsOfFile: path)!
        // Do any additional setup after loading the view, typically from a nib.
        
        print(dico)
        
        etqNom.text = dico["nom"] as! String
        etqPrenom.text = dico["prenom"] as! String
        
        etqDateNaissance.text=(dico["Date naissance"] as AnyObject).description
        
        txtNbEnfant.text = (dico["nombre enfants"] as AnyObject).description
        
        txtSalaire.text = (dico["salaire"] as AnyObject).description
        
        txtTelephone.text = ""
        

        
        let fm = FileManager.default
        
        let urlRepDocuments = try! fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:true)
        
        let url = urlRepDocuments.appendingPathComponent("Plist.plist")
        
       
        if let dico2 = NSMutableDictionary.init(contentsOfFile: url.path)
        {
            txtTelephone.text = dico2["Telephone"] as! String
            txtSalaire.text = (dico2["Salaire"] as! Float).description
            txtNbEnfant.text = (dico2["nombre enfants"] as! Int).description
            
        }
    }


    @IBAction func btnSauvegarder(_ sender: UIButton) {
        print("button clicked")
        //pour assurer la persistance des 
        //modifications oppérée, il faut
        // créer un autre fichier plist et
        //stoquer les données dedans
        //récupérer et valider la saisie
        let telephone = txtTelephone.text
        
        var erreurTrouvée:Bool = false
        var salaire : Float = -1
        if let valeur = Float(txtSalaire.text!)
        {
            salaire = valeur
        }
        else
        {
            erreurTrouvée = true
        }
        
        
        if !erreurTrouvée
        {
            erreurTrouvée = salaire < 0 || salaire > 20_000
        }
        if erreurTrouvée
        {
            print("La valeur du salaire est erronée")
            
            let alert = UIAlertController(
                title: "message",
                message: "La valeur du salaire est erronée",
                preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "",
                                          style: UIAlertActionStyle.default){
                                           (a) in print("L'alerte affiché")})
            
            present(alert, animated: true, completion: nil)
            return
        }
        
        //récupérer erreur enfants
        var nbEnfants : Int = -1
        if let valeur = Int(txtNbEnfant.text!.trim())
        {
            nbEnfants = valeur
        }
        else
        {
            erreurTrouvée = true
        }
        
        
        if !erreurTrouvée
        {
            erreurTrouvée = nbEnfants < 0 || nbEnfants > 13
        }
        if erreurTrouvée
        {
            print("Le nombre d\"enfant est erronée")
            
            let alert = UIAlertController(
                title: "message",
                message: "Le nombre d\"enfant est erronée",
                preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Fermer",
                                          style: UIAlertActionStyle.default){
                                            (a) in print("L'alerte affiché")})
            
            present(alert, animated: true, completion: nil)
            return
        }
        
        let dico = NSMutableDictionary()
        dico["Telephone"] = telephone
        dico["Salaire"]=salaire
        dico["nombre enfants"]=nbEnfants
        
        let fm = FileManager.default
        
        let urlRepDocuments = try! fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:true)

        let url = urlRepDocuments.appendingPathComponent("Plist.plist")
        
        //sauvegarder le dictionnaire
        dico.write(to: url, atomically: true)
        
        print(url)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension String
{
    func trim() -> String{
        return self.trimmingCharacters(in:CharacterSet.whitespaces)
    }
}
