//
//  ViewController.swift
//  11_CoreData
//
//  Created by etudiant on 6/1/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtNom.text = "a"
        txtAdresse.text = "b"
        txtTelephone.text = "c"
     
        txtDisplay.text = "d"
        
    }
  
      @IBOutlet weak var txtNom: UITextField!
    @IBOutlet weak var txtAdresse: UITextField!
    @IBOutlet weak var txtTelephone: UITextField!
    @IBOutlet weak var txtDisplay: UILabel!
    @IBAction func btnSauvegarderTouched(_ sender: UIButton) {
        
        print("sauvegarde")
        //Récupérer le délégué de l'application (application delegate)
        // il s'agit d(une object qui contient des informations
        // sur l'application
        
        //solution 1
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate
        {
            //utiliser le délégue
            // récupére le contexter 
            //créer les instances, les attacher au contexte, sauvegarder le contextEncryptionKeyLength
            //etc
            
        }
        else
        {
            
        }
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else{
                print("Echec récupération déléguée")
                return
        }
        //utiliser le délégué récupéré
        
        //solutiion 3
        //na pas faire appel à un binding mais forcer le transypage
        //let appDelegate = Ui...
        
        //récupérer le contexte CoreData
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //lancer l'application et vérifier si le fichier est crée par core Data
        
        //find . -name MonModeleDeDonnees.sqlite -print

        //dans le répéertoire 
        //créer une instance de l'éntité Personne
        //récupérer d'abord la description de l'entité Personne
        //On utilise la classe NSEntityDescription(import CoreData)
        let descriptionPersonne = NSEntityDescription.entity(forEntityName: "Personne", in: managedContext)
        
        //construire une instance de Personne et la déposer dans le contexte
        let personne = Personne(entity: descriptionPersonne!, insertInto: managedContext)
        
        //peuple la personne 

        personne.nom = txtNom.text
        personne.adresse = txtAdresse.text
        personne.telephone = txtTelephone.text

        //rendre la personne persistante
        //pour assurer la persistance des données, il faut sauvegarder
        //le contexte(c'est ce contexte qui contient les données)
        //insérer / modifier /supprimer au niveau de l'application
        
        do
        {
            try managedContext.save()
        }catch let erreur
        {
            txtDisplay.text = "echec sauvegarde context\n raison: " + erreur.localizedDescription
        }
        
        
    }
    
    @IBAction func btnRercherNomEtPrenom(_ sender: UIButton) {
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let leContexte = appDelegate.persistentContainer.viewContext
        
        let descriptionPersonne = NSEntityDescription.entity(forEntityName: "Personne", in: leContexte)
        
        //créer une requête
        let requete : NSFetchRequest<Personne> = Personne.fetchRequest()
        
        //créer un prédicat (l'équivalent de la clause WHERE de SQL)
        
        //le groupe = [c]
// assure une recherche case insentive  
        //si on veut assuerer une recherche qui ne tient pas complte des diacritiques
        //ilm faut utiliser = [d]
        //pour une rechrrche insensitive aussi bien à la basse qu'aux diacritiques
        // on utilise = [cd]
        
        
        //ici dans notre prédicat on teste  l'égalité des valeurs mais on peut 
        
        //il existe d'uatres opérateurs comme CONTAINS,LIKE, BEGINWITH, MATCHES, 
        
        // BEGINWITH[cd]
        
        
        
        
        let predicat = NSPredicate(format: "nom=[c]%@ && adresse=%@", txtNom.text!,txtAdresse.text!)
        
        
        //passer ce prédicat à la requête
        requete.predicate = predicat
        
        //executer la requête
        
        do{
            
            let personnes = try leContexte.fetch(requete)
            
            txtDisplay.text = "nombre d'articles trouvés: \(personnes.count)"
            
            // a-t-on trouvé qqc
            if personnes.count > 0
            {
                //une ou plusieurs personnes ont été troucée
                //je me limite à la 1er 
                
                let personne = personnes.first
                
                //récupéréer et afficher les valeurs des différentes propriété
                
                //récupérer et afficher le nom de la personnes
                txtNom.text = personne!.value(forKey: "nom") as! String
                txtAdresse.text = personne!.value(forKey: "adresse") as! String
                txtTelephone.text = personne!.value(forKey: "telephone") as! String
                
            }else{
                txtDisplay.text = "La recherche n'a rien trouvé"
                
                //récupérer et afficher les valeurs des différentes propriétés de cettte instance
                
                //récupérer et afficher le nom de la personne
                
            }
            
        }catch let erreur
        {
            txtDisplay.text = "Erreur: " + erreur.localizedDescription
        
        }
        
        
        }
      @IBAction func btnSupprimerBaseTouched(_ sender: UIButton) {
        
        //je dois créer l'url du fichier .sqlite de la base
        //je commence par obtenir une instence de gestionnaire de fichier File Manager
        
        let fm = FileManager.default
        
        //récupérer l'url du répértoire racine ou la base a été stoquée
        
        
        var tbUrls =   fm.urls(for: FileManager.SearchPathDirectory.libraryDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)
        
        // ou
        
      //  var tbUrls = fm.urls(for: .libraryDirectory, in: .userDomainMask)
        
        var tbUrl = tbUrls.first!
        
        //ajouter au répéertoire le sous-répéertoire ou se trouve le fichier .sqlite(répéertoire trovué avec la commande unix 'find')
        
        //tbUrl.appendPathComponent("Application Support/MonModeleDeDonnees.sqlite")
        //plus propre
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        tbUrl.appendPathComponent("Application Support/"+appDelegate.persistentContainer.name+".sqlite")
        print(tbUrl)
        
        //supprimer l'url plus haut
        do{
        try appDelegate.persistentContainer.persistentStoreCoordinator.destroyPersistentStore(at: tbUrl, ofType: NSSQLiteStoreType, options: nil)
            
            txtDisplay.text = "la base a été supprimé"
        }
        catch let erreur
            {
            txtDisplay.text = "Echec " + erreur.localizedDescription
        }
        
        //l'opération précédente a supprimer le store
        //du fichier MonModeleDeDonnees.sqlite sans en créer un autre
        //si maintenant on essai de l'inserer une personne , on obitnent
        //l'éerreur suivante
        //coreData ; error illegal attemp to save to a file that was never opened
        //this NSPersistent has no persistent stores
        
        //il faut donc ajouter un store (une base) dans le fichier
        // dont l'url a été obtenue plus haut'
        do{
            try appDelegate.persistentContainer.persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: tbUrl, options: nil)
        }
        catch let erreur
        {
            txtDisplay.text = "Erreur: " + erreur.localizedDescription
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    
    }


}

