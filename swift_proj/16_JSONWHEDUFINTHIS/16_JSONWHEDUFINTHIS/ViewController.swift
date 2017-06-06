//
//  ViewController.swift
//  16_JSONWHEDUFINTHIS
//
//  Created by etudiant on 06/06/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func btnAssynchroneTouched(_ sender: Any) {
    }
  @IBOutlet weak var btnOkTouched: UIButton!
    @IBAction func btnOkTouched(_ sender: Any) {
        afficherPageWeb(txtUrl.text!)
    }
    @IBAction func btnJsonTouched(_ sender: Any) {
        
        //récupérer l'adresse (format texte) saisie et créer eune URL dessus
        let url = URL(string: txtUrl.text!)
        
        //Créer Session assynchrone
        let session = URLSession.shared
        
        //créer une tache qui lorsque son execution sera demandée
        //va charger le contenu du docuement référencé par l'url
        session.dataTask(with: url!){
        (donneesChargees,reponse, erreur) in
            
            if donneesChargees == nil{
                print("aucune donénes n'a été chargé")
                let html = "<p><Strong> hello</strong> </b>"
                self.maWebView.loadHTMLString(html, baseURL: nil)
            }
        }
      
    }
    @IBOutlet weak var txtUrl: UITextField!
        @IBOutlet weak var maWebView: UIWebView!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlTexte = "192,168,21,112:8000/ServiceRestavecJSON/monService"
        let urlTxt = "http://www.apple.com"
        txtUrl.text = urlTxt
        
        afficherPageWeb(urlTxt);
    }
    
    func afficherPageWeb(_ urlTexte: String)
    {
        let url = URL(string: urlTexte)!
        
        let requete = URLRequest(url: url)
        
        maWebView.loadRequest(requete)
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

