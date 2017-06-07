//
//  ViewController.swift
//  16_JSONWHEDUFINTHIS
//
//  Created by etudiant on 06/06/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      //  let urlTexte = "192,168,21,112:8000/ServiceRestavecJSON/monService"
       // let urlTxt = "http://www.greceanu.com/experience.txt"
        //let urlTxt = "http://www.apple.com"
        let urlTxt = "5"
        
        txtUrl.text = urlTxt
        
        //afficherPageWeb(urlTxt);
    }
    
    
    
    @IBAction func btnAssynchroneTouched(_ sender: Any) {
        //récupérer l'adresse (format texte) saisie et créer eune URL dessus
        let url = URL(string: txtUrl.text!)
        
        //Créer Session assynchrone
        let session = URLSession.shared
        
        //créer une tache qui lorsque son execution sera demandée
        //va charger le contenu du docuement référencé par l'url
        let tache = session.dataTask(with: url!){
            (donneesChargees,reponse, erreur) in
            //les types des 3 arguments
            //data?  urlResponse, error?
            
            //a -ton-on eu une erreur lors de l'échange
            if erreur != nil
            {
                let html = "<html><body><p style='color:red;'>une erreur a été levée</p>" +
                "<br>raisons invoquée :" +
                erreur!.localizedDescription +
                "</body></html>"
                self.maWebView.loadHTMLString(html, baseURL: nil )
                return
            }
            
            if donneesChargees == nil{
                print("aucune donénes n'a été chargé")
                var html = "<html><body>n"
                
                html += "<p><Strong> aucune donénes n'a été chargé</strong> </b></body></html>"
                self.maWebView.loadHTMLString(html, baseURL: nil)
                return
            }
            
            if let txt = NSString(data: donneesChargees!, encoding: String.Encoding.utf8.rawValue)
            {
                self.maWebView.loadHTMLString("\(txt)", baseURL: nil)
            }else
            {
                self.displayWebView("les données chargées ne peuvent être converti au format texte")
            }
        }//fin cloture
        tache.resume()

        
    }
  @IBOutlet weak var btnOkTouched: UIButton!
    @IBAction func btnOkTouched(_ sender: Any) {
        afficherPageWeb(txtUrl.text!)
    }
    
    @IBAction func btnJsonTouched(_ sender: Any) {
        // butr : 
        // envoyer des informatiosn formatée en json vers
        //un serveur et  récupérer sa réponse
        
        
        //notre serveur attent  un object avec é propriétés
        //-nombre
        //-prefix
        // et il envoi des objets jsopn ayant come propriété
        //id
        //nom
        //population
        //les objets json du tableau sont des villes dont le nom est
        // construuit par le serveur à partir du prefix envoyé
        // leur nombre st égal à la valeur de al paroprité 'nombre'
        // envoyéé au serveur
        
        
        //pour pouvoir réer uen cha!ine JSON je dois stocker les donénes dans un dictionnaire
        
        //créer un dictionnaire contenant les donénes à envoyer au serveur 
        
        let dicInfos:[String:Any] = [
            "nombre" : txtUrl.text!,
            "prefix" : "Bruxelles"
        ]
        
        //jsonifier ce dictionnaire 
        let txtJson = Util.jsonfier(dicInfos)
        print(txtJson)
        
        // créer une url
        let urlServeur = URL(string: "http://192.168.21.112:8080/ServiceRestavecJSON/monService/test/")
        
        //créer une requête
        var requete = URLRequest(url: urlServeur!)
        
        //Configurer la requête pour l'utiliser la méthode transfert HTTP POST
        requete.httpMethod = "POST"
        
        //injecter les données dans la requête attachées à des clé 
        //exemplesclé/valeur
        // client = Pierre
        // age = 25
        // couleurPreferee = bleur
        
        // dans notre cas , la données à envoyer et le texte txtJson
        // et le serveur attent à la clé "json"
        
        let donneesRequete = "json=\(txtJson)"
        
        //injecter ces donées (sous forme binaire) das la requête
        requete.httpBody = donneesRequete.data(using: String.Encoding.utf8)
        
        //créer une session de travail asynchrone
        let session = URLSession.shared
        
        //créer une tache
        let tache = session.dataTask(with: requete) { (donneesChargees, response, error) in
            //les types des 3 arguments
            //data?  urlResponse, error?
            
            //a -ton-on eu une erreur lors de l'échange
            if error != nil
            {
                let html = "<html><body><p style='color:red;'>une erreur a été levée</p>" +
                    "<br>raisons invoquée :" +
                    error!.localizedDescription +
                "</body></html>"
                self.maWebView.loadHTMLString(html, baseURL: nil )
                return
            }
            
            if donneesChargees == nil{
                print("aucune donénes n'a été chargé")
                var html = "<html><body>"
                
                html += "<p><Strong> aucune donénes n'a été chargé</strong> </b></body></html>"
                self.maWebView.loadHTMLString(html, baseURL: nil)
                return
            }

            //créer un objet SWIFT à partir de la chaine JSON envoyée 
            // par le serveur
            print("données chargée : \(donneesChargees!)")
            var objetRetour:Any
            do
            {
            objetRetour = try JSONSerialization.jsonObject(with: donneesChargees!, options: [])
                
                print("erreur")
                //afficher l'objet de façon raw(brute)
                self.maWebView.loadHTMLString("\(objetRetour)", baseURL: nil)
            }catch
            {
                var html = "l'obtention d'un objet à partir du json envoyé par le serveur a échoué \n raison invoquée:" + error.localizedDescription
                self.displayWebView(html)
                return
            }
            
            //l'objet envoyé par le serveur est en fait
            // un tableau de dictionnaires
            let tb = objetRetour as! Array<Dictionary<String, Any>>
            
            //parcourir le tableau de disctionnaires et afficher
            // lecontenu de chaque dictionnaire
            
            var dictionnaire : Dictionary<String,Any>
            
            var html = "<br><h3 style='text-align:center'>" +
            "le contenu des villes récupérées </h3>"
            
            for i in 0..<tb.count
            {
                 dictionnaire = tb[i]
                
                html += "<br>Id: \(dictionnaire["id"] as! Int)"
                html += "<br>Ville: \(dictionnaire["nom"] as! String)"
                html += "<br>Population: \(dictionnaire["population"] as! Int)"
                html += "<br>*****"
        
            }
            self.maWebView.loadHTMLString(html, baseURL: nil)
        }
        tache.resume()
        
    }
    @IBOutlet weak var txtUrl: UITextField!
        @IBOutlet weak var maWebView: UIWebView!
    

    
    func afficherPageWeb(_ urlTexte: String)
    {
        let url = URL(string: urlTexte)!
        
        let requete = URLRequest(url: url)
        
        maWebView.loadRequest(requete)
        
        
    }
    
    func displayWebView(_ content: String)
    {
        var html = "<html><body>n"
        
        html += "<p style='color:red;'><Strong> \(content)</strong> </b></body></html>"
        self.maWebView.loadHTMLString(html, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

