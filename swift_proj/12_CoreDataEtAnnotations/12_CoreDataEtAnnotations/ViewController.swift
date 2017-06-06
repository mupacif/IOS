//
//  ViewController.swift
//  12_CoreDataEtAnnotations
//
//  Created by etudiant on 02/06/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

/**
 Une association(relation) entre 2 tables a:
 -un nom
 -une destination
 -une cardinalité
 -une règle de suppression
 -une relation inverse
 */

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var txtDisplay: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
           // initialiser()
    }
    func afficherTexte(_ texte: String)
    {
        //ajouter le texte à afficher au contenu existant de txtDiplay
        txtDisplay.text = txtDisplay.text! + texte + "\n"
    }
    
    func initialiser()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let fm = FileManager.default
        let urlRepLibrary = fm.urls(for: .libraryDirectory, in: .userDomainMask).first!
        
        //créer l'url du fichier  sqlite en ajoutant
        //- le sous répertoire application support
        //- le nom du ficheir sqlite
        // - l'extention .sqlite
        let urlDB = urlRepLibrary.appendingPathComponent("Application Support/" + appDelegate.persistentContainer.name+".sqlite")
        print("*****")
        print(urlDB)
        
        let context = appDelegate.persistentContainer.viewContext
        
        //find . -name "LeModeleDeDonnees.sqlite" -print
        
        do{
            try appDelegate.persistentContainer.persistentStoreCoordinator.destroyPersistentStore(at: urlDB, ofType: NSSQLiteStoreType, options: nil)
               afficherTexte("La base de données a été supprimée")
        }catch let error
        {
            afficherTexte("La supression de la base a échoué" + " Raison invoquée/\n"+error.localizedDescription)
            
        }
        
        //recréer la base
        
        do{
            try appDelegate.persistentContainer.persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: urlDB, options: nil)
            afficherTexte("La base de données a été recrée")
        }catch let error
        {
            afficherTexte("La recréation de la base a échoué" + " Raison invoquée/\n"+error.localizedDescription)
            
            return
        }
        
        //peuple la base
        let personne1 = creerPersonne(argNom: "Chirac", argPrenom: "Jacques", argAge: 180)
        let personne2 = creerPersonne(argNom: "Chirac", argPrenom: "Bernadette", argAge: 170)
        let personne3 = creerPersonne(argNom: "Hollande", argPrenom: "Francois", argAge: 60)
        let personne4 = creerPersonne(argNom: "nom 4", argPrenom: "prenom 4", argAge: 44)
        let personne5 = creerPersonne(argNom: "nom 5", argPrenom: "prenom 5", argAge: 55)
        
        let adresse1 = creerAdresse(no: "25", rue: "Rivoli", ville: "Paris", pays: "France")
        
        let adresse2 = creerAdresse(no: "17", rue: "Rue des vacances", ville: "St troppez", pays: "France")
        
        let adresse3 = creerAdresse(no: "1", rue: "Elysé", ville: "Paris", pays: "France")
        
        let adresse4 = creerAdresse(no: "44", rue: "rue 4", ville: "ville 4", pays: "pays 4")
        
        //utiliser la relation (l'association) 'adresses" de l'entité Personne(qui est association many-to-many)
        
        personne1.adresses = NSSet(object: adresse1)
        personne2.adresses = NSSet(objects: adresse1,adresse2,adresse4)
       // personne1.adresse = NSSet(object: adresse)
        //utiliser l'association 'conjoin" entre personne et personne qui est one-to-one)
        
        
        //modifier le jeux d'adresses de personne1
        //je le récupère d"abord
        let adresses = personne1.adresses
        //ajouter uen nouvelle adresse à ce jeu
        adresses!.adding(adresse3)
        
        
        personne3.adresses = NSSet(object: adresse1)
        
        personne4.adresses = NSSet(object: adresse4)
        //utiliser l'association 'conjoint'
        //marier les chiracs
        personne1.conjoint = personne2
        
        //on aurait pu écrire
        //personne2.conjoint = personne1
        
        //utiliser la rélation 'enfants' entre Personne et Personne
        //Version 1
        personne1.enfants = NSSet(objects: personne4, personne5)
        
        //au lieu de déclarer les enfants du p!re on aurait pu d"clarer le p!re des enfants
        personne4.pere = personne1
        
        //je dois sauvegarder le cont     let context = getContext()
        do{
            try context.save()
            afficherTexte("La sauvegarde des données a reussi")
        }catch let erreur
        {
            afficherTexte("La sauvegarde des données a échoué\n" + erreur.localizedDescription)
        }
        
        
    }
    @IBAction func btnAffichedContenuTouched(_ sender: UIButton) {
        
        var txt = recuperPersonnes()
        afficherTexte(txt)
        
        txt = recupererAdresses()
        afficherTexte(txt)
    }
    
    func recuperPersonnes()->String
    {
        var txt = ""
        let ctx = getContext()
        
        //récupérer la description de personne
        let descriptionPersonne = NSEntityDescription.entity(forEntityName: "Personne", in: ctx)!
        
        //créer uen requête qui, après exécution,
        //récupérera des personnes
        let requete : NSFetchRequest<Personne> = Personne.fetchRequest()
        
        //passer le descriptiof
        requete.entity = descriptionPersonne
        //si on veut trier le résultat de la sélection$
        //on ajoute un descripteur de tri(ascendent ou descendnet
        
        //je veux  d'abord trier sur le nom
        let descripteurTrie1 = NSSortDescriptor(key: "nom", ascending: true)
        //sur le prénom
        let descripteurTrie2 = NSSortDescriptor(key: "prenom", ascending: false)
        
        //ajouter le descripteur de tri à la requete
        requete.sortDescriptors = [descripteurTrie1,descripteurTrie2]
        
        //executer la requete
        do{
            let personnes = try ctx.fetch(requete)
            txt += "Les personnes de la base:"
            for personne  in personnes
            {
                    txt += "\(personne.nom!) \(personne.prenom!), age \(personne.age)\n"
                //récupérer les adresses
                let adresses = personne.adresses
                if adresses == nil || adresses!.count == 0
                {
                    txt += "\n Aucune adresse connue"
                }else
                {
                    txt += "\tAdresse(s):"
                    var adresse:Adresse
                    for adr in adresses!
                    {
                        adresse = adr as! Adresse
                        txt += "\n\t\(adresse.numero!),\(adresse.rue!), " + "\(adresse.ville!),\(adresse.pays!)"
                    }
                }
                //récupérer et afficher le conjoint
                let conjoint = personne.conjoint
                if conjoint == nil
                {
                    txt += "\n\t sans conjoins"
                }else{
                    txt += "\n\tConjoint: \(conjoint!.prenom!) \(conjoint!.nom!)\n"
                }
                
                //récupérer le père
                let pere = personne.pere
                if pere == nil{
                    txt += "\t père non précisé\n"
                }else{
                    txt += "\tpère/ \(pere!.prenom!) \(pere!.nom!)\n"
                }
                
                //récupérer les enfants
                let enfants = personne.enfants
                if enfants == nil || enfants!.count == 0
                {
                    txt += "\t pas d'enfants \n"
                }else{
                    txt += "\tEnfants(s):"
                    for enfant in enfants!
                    {
                            txt += "\n\t\((enfant as! Personne).prenom)"
                    }

                }
            }
        }catch let error
        {
             afficherTexte("Impossible d'effectuer la requête raisons : " + error.localizedDescription)
        }
        
 

        
        return txt
    }
    
    func recupererAdresses()->String
    {
        var ctx = getContext()
        //récupérer la description de personne
        let descriptionAdresse = NSEntityDescription.entity(forEntityName: "Adresse", in: ctx)!
        
        //créer uen requête qui, après exécution,
        //récupérera des personnes
        let requete : NSFetchRequest<Adresse> = Adresse.fetchRequest()
        
        //passer le descriptiof
        requete.entity = descriptionAdresse
        var txt = ""
        do{
            let adresses = try ctx.fetch(requete)
            txt += "les adresses de la base"
            
            for adr in adresses{
                txt += "\n\(adr.numero!) \(adr.rue!) \(adr.ville!) \(adr.ville!)"
                
                let personnes = adr.personnes
                if personnes == nil || personnes!.count == 0
                {
                    txt += "\n\tAucune personne n'habite à cette adresse\n"
                }else{
                    txt += "\n\tHabitants:"
                    for personne in personnes!
                    {
                        txt += "\n\t\((personne as! Personne).prenom!)" +
                        "\((personne as! Personne).nom!), age:" +
                        "\((personne as! Personne).age)"
                    }
                }
                txt += "\n"
            }
        }catch let erreur
        {
            print("erreur :"+erreur.localizedDescription)
        }
        return txt
    }
    @IBAction func btnInitialiserTouched(_ sender: UIButton) {
        initialiser()
    }
    @IBAction func btnRAZtouched(_ sender: UIButton) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getContext()-> NSManagedObjectContext
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }

    func creerPersonne(argNom: String, argPrenom: String, argAge: Int)->Personne
    {
        let context = getContext()
        //récupérer la desription de l'entité Personne
        let description = NSEntityDescription.entity(forEntityName: "Personne", in: context)!
        
        //créer une instanve de cette entité
        let personne = Personne(entity: description, insertInto: context)
        
        //peuple l'entité
        personne.nom = argNom
        personne.prenom = argPrenom
        personne.age = Int16(argAge)
        
        return personne
    }
    
    func creerAdresse(no:String,rue:String,ville:String,pays:String)->Adresse
    {
        let context = getContext()
        
        //récupérer la descreiption de l'(entité adresse
        let descriptionEntité = NSEntityDescription.entity(forEntityName: "Adresse", in: context)!
        
        let adresse = Adresse(entity: descriptionEntité, insertInto: context)
        
        adresse.numero = no
        adresse.rue = rue
        adresse.ville = ville
        adresse.pays = pays
        
        return adresse
    }
    @IBAction func btnModifierPersonneTouched(_ sender: Any) {
        //modifier la personne 'nom 4 prenom 4'
        // - incrémenter son age
        // - supprimer l'association "adresse"
        let ctx = getContext()
        //récupérer la description de Personne
        let descriptionPersonne = NSEntityDescription.entity(forEntityName: "Personne", in: ctx)
        
        //récupérer à partir du conteneur persistant (donc de la base) la personne Nom 4 prenom 4
        
        //créer une requête
        let requete: NSFetchRequest<Personne> = Personne.fetchRequest()
        
        //lui passer le description
        requete.entity = descriptionPersonne
        
        //créer un prédicat pour filter seulement la persone recherchée sans tenir compte de la casse et des diacritiques
        
        let predicat = NSPredicate(format: "nom=[cd]'nom 4' and prenom=[cd]'prenom 4'")
        
        //fournir ce prédicat à la requête
        requete.predicate = predicat
        
        //executer la requete
        
        do
        {
            let tbPersonnes = try ctx.fetch(requete)
            if tbPersonnes.count == 0
            {
                afficherTexte("la personne a modifier 'nom 4 prenom 4' n'a pas été trouvé")
                return
            }
            else if tbPersonnes.count > 1
            {
                afficherTexte("Plusieurs personnes nom 4 prénom 4 ont été trouvés modification abandonnée")
                return
            }
            
            
            //mettre la seule et unique personne du tableau
            // tbPersonnes dans une constante pour simplifier le code
            let personne = tbPersonnes.first
            
            //modifier l'age de la personne
            personne!.age += 1
            
            //supprimer l'association adresses
            personne!.adresses = nil
            //rendrte les modifications persistznte
            //sauvegarder le contexte
            
            do
            {
                try ctx.save()
                afficherTexte("la personne nom 4 prenom 4 a été modifier et sauvegarder")
            }catch let erreur
            {
                afficherTexte("la modif de la personne nom4 prenom 4 a échoué, raison invoqué:"+erreur.localizedDescription)
            }
        }catch let erreur
        {
            print("erreur : "+erreur.localizedDescription)
        }

    }
    @IBAction func btnModifierPersonneV2Touched(_ sender: UIButton) {
        
        let ctx = getContext()
        //récupérer la description de Personne
        let descriptionPersonne = NSEntityDescription.entity(forEntityName: "Personne", in: ctx)
        
        //récupérer à partir du conteneur persistant (donc de la base) la personne Nom 4 prenom 4
        
        //créer une requête
        let requete: NSFetchRequest<Personne> = Personne.fetchRequest()
        
        //lui passer le description
        requete.entity = descriptionPersonne
        
        //créer un prédicat pour filter seulement la persone recherchée sans tenir compte de la casse et des diacritiques

        let predicat = NSPredicate(format: "%K=%@ and %K=%@", "nom","Chirac","prenom","Bernadette")
        
        requete.predicate = predicat
        
        //executer le requête
        var tbPersonnes : [NSFetchRequestResult]
        do{
            tbPersonnes = try ctx.fetch(requete)
            if tbPersonnes.count == 0
            {
                afficherTexte("la personne a modifier nom prenom 4 n'a pas étét trouvé")
                return
            }
            else if tbPersonnes.count > 1
            {
                afficherTexte("plusieurs personnes nom 4 et prenom 4 on été trouyvé modification abandonnée")
                return
            }
        }catch let erreur
        {
            afficherTexte("la récupération de la personne chirac bernadette 4 a échoué pour la raison invoqué /"+erreur.localizedDescription)
            return
        }
        
        
            let personne = tbPersonnes.first as! Personne
            
            let adresses = personne.adresses
            
            if adresses == nil || adresses!.count == 0
            {
                afficherTexte("Aucune adresse connu pour bernadette Chirac")
                return
            }
            
            //pour trouver l'adresse à supprimer je peux utiliser la solution 2
            
            //solution 1
            //bouicler sur le jeux d'adresse afin de trouver celle à supprimer
            var trouvé : Bool = false
            var adresse:Adresse
            for adr in adresses!
            {
                adresse = adr as! Adresse
                if adresse.numero!.lowercased() == "44" &&
                    adresse.rue!.lowercased() == "rue 4" &&
                    adresse.ville!.lowercased() == "ville 4" &&
                    adresse.pays!.lowercased() == "pays 4"
                {
                    //j'ai trouver l'adresse à supprimer
                    //je la suprime 
                    //méthode 1
                        //ctx.delete(adresse)
                    
                    
                    //méthode 2
                    var jeuxModifible = NSMutableSet(set: adresses!)
                    jeuxModifible.remove(adresse)
                    
                    
                    //donner ce nouveau set d'adresse à la personne en question (Bernadette)
                    personne.adresses = jeuxModifible
                    
                    trouvé = true;
                }
            }
            
            if !trouvé
            {
                      afficherTexte("le récupération de la personen chirac bernadette 4 a échoué raison invoquée /")
                return
            }
            
        do{
            try ctx.save()
            afficherTexte("l'adresse  44 rue 4 ville 4 pays 4, a été supprimé")
        }catch let erreur
        {
            afficherTexte("l'adresse  44 rue 4 ville 4 pays 4, n'a pas été supprimé ")
        }
        
    }
    @IBAction func btnSupprimerAdressTouched(_ sender: UIButton) {
        //je veux supprimer de la base l'adresse suivante
        // 25 Rivoli, paris, France
        
        let ctx = getContext()
        //récupérer la description de Personne
        let description = NSEntityDescription.entity(forEntityName: "Adresse", in: ctx)
        
        //récupérer à partir du conteneur persistant (donc de la base) la personne Nom 4 prenom 4
        
        //créer une requête
        let requete: NSFetchRequest<Adresse> = Adresse.fetchRequest()
        
        //lui passer le description
        requete.entity = description
        //créer un prédicat pour filter seulement la persone recherchée sans tenir compte de la casse et des diacritiques
        
        let predicat = NSPredicate(format: "%K=%@ and %K=%@ and %K=%@ and %K=%@", "numero","25","rue","Rivoli","ville","Paris","pays","France")

        requete.predicate = predicat
        
        //executer la commande
        var tbAdresses : [NSFetchRequestResult]
        do{
            tbAdresses = try ctx.fetch(requete)
            if tbAdresses.count == 0
            {
                afficherTexte("l'adresse à modifier 25 Rivoli, paris, France n'a pas étét trouvé")
                return
            }
            else if tbAdresses.count > 1
            {
                afficherTexte("plusieurs adresses25 Rivoli, paris, France on été trouvé, modification abandonnée")
                return
            }
            
            ctx.delete(tbAdresses.first as! NSManagedObject)
            
            //sauvegarde du contexte
            
            do{
                try ctx.save()
                afficherTexte("l'adresses25 Rivoli, paris a été supprimé")
            }catch let erreur
            {
                afficherTexte("l'adresses25 Rivoli, paris,  n'a pas été supprimé :"+erreur.localizedDescription)
            }

        }catch let erreur
        {
            afficherTexte("la récupération de la l'adresse 25 Rivoli, paris, France a échoué pour la raison invoqué /"+erreur.localizedDescription)
            return
        }
        


    }
    @IBAction func btnSelectionPersonnesSurAdresseTouched(_ sender: UIButton) {
        
        
        let ctx = getContext()
        //récupérer la description de Personne
        let description = NSEntityDescription.entity(forEntityName: "Personne", in: ctx)
        

        //créer une requête
        let requete: NSFetchRequest<Personne> = Personne.fetchRequest()
        
        //lui passer le description
        requete.entity = description
       
        
        let predicat = NSPredicate(format: "ANY %K=[c]%@ and ANY %K=[c]%@ and ANY %K=[c]%@ and ANY %K=[c]%@",
            "adresses.numero", "25",
            "adresses.rue","Rivoli",
            "adresses.ville", "paris",
            "adresses.pays", "france")
        //on utilise any car on veut trouver les personnes ayant dans la collection adreqse au moins une adresse dont les champs ont les valeurs indiquées
        //ANY %K=[c]%@ and ANY %K=[c]%@ and ANY %K=[c]%@ and ANY %K=[c]%@"
        
        //si on veut trouver les personnes ayant une adresses(n'importe laquelle)
        //let predicat = NSPredicate(format: "%K=nil", "adresses")
        
        //https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreData/FetchingObjects.html
        //https://developer.apple.com/documentation/foundation/nspredicate
        //https://www.hackingwithswift.com/read/38/7/examples-of-using-nspredicate-to-filter-nsfetchrequest
        requete.predicate = predicat
        
        //executer la requetedo
        do {
                 let tbPersonnes = try ctx.fetch(requete)
                if tbPersonnes.count == 0
                {
                    afficherTexte("Aucune personne n'habite au 25 Rivoli ,Paris, France")
                    return
                }
                
                afficherTexte("Liste de personnes habitant au 25 rivoli, paris, france")
                for personne in tbPersonnes
                {
                    afficherTexte("\(personne.prenom)")
                }
        }
        catch let erreur
        {
            afficherTexte("la récupération des personnes habitant à l'adresse 25 rivoli paris france a echoué raison /"+erreur.localizedDescription)
        }
    }
}



