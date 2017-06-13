//
//  MainList.swift
//  Explorer
//
//  Created by etudiant on 08/06/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit
import MapKit
import CoreData
class MainList: UIViewController ,UITableViewDataSource {

 
    var liste:[String]=[]
    var itemsList:[ExplorerItem]=[]
    @IBOutlet weak var tableList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableList.dataSource = self
        initialisation()
        // Do any .dataSource = self setup after loading the view.
    }
    func initialisation()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let fm = FileManager.default
        let urlRepLibrary = fm.urls(for: .libraryDirectory, in: .userDomainMask).first!
        let urlDB = urlRepLibrary.appendingPathComponent("Application Support/" + appDelegate.persistentContainer.name+".sqlite")
        let context = appDelegate.persistentContainer.viewContext
        
        do{
            try appDelegate.persistentContainer.persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: urlDB, options: nil)
            print("la db a été créée")
        }catch let error
        {
            print("erreur créeation de la db ou la db existe deja")
            //refreshElements()
            refreshItemElements()
            return
        }
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
    


    @IBAction func btnDeleteItemTouched(_ sender: UIButton) {
        print("delete")
        
        let indexPath = tableList.indexPathForSelectedRow
      
        guard indexPath != nil else {
            print("nothing selected:")
            return
        }
        var item = itemsList[indexPath!.row]
      
      
        
        let ctx = getContext()
        //récupérer la description de Personne
        let description = NSEntityDescription.entity(forEntityName: "MapItem", in: ctx)
        
        //récupérer à partir du conteneur persistant (donc de la base) la personne Nom 4 prenom 4
        
        //créer une requête
        let requete: NSFetchRequest<MapItem> = MapItem.fetchRequest()
        
        //lui passer le description
        requete.entity = description
        //créer un prédicat pour filter seulement la persone recherchée sans tenir compte de la casse et des diacritiques
        
        let predicat = NSPredicate(format: "%K=%@ ", "name", item.name!)
        
        requete.predicate = predicat
        
        //executer la commande
        var tbAdresses : [NSFetchRequestResult]
        do{
            tbAdresses = try ctx.fetch(requete)
            if tbAdresses.count == 0
            {
                print("l'adresse à  n'a pas été trouvé")
                return
            }
            else if tbAdresses.count > 1
            {
                print("plusieurs adresses25 Rivoli, paris, France on été trouvé, modification abandonnée")
                return
            }
            
            ctx.delete(tbAdresses.first as! NSManagedObject)
            
            //sauvegarde du contexte
            
            do{
                try ctx.save()
                print("l'adresses a été supprimé")
                refreshItemElements()
            }catch let erreur
            {
                print("l'adressesn'a pas été supprimé :"+erreur.localizedDescription)
            }
            
        }catch let erreur
        {
            print("la récupération de la l'adresse 25 Rivoli, paris, France a échoué pour la raison invoqué /"+erreur.localizedDescription)
            return
        }
    }
    func refreshElements()
    {
        print("refreshing")
        let ctx = getContext()
        let description = NSEntityDescription.entity(forEntityName: "Liste", in: ctx)!
        
        let requete : NSFetchRequest<Liste> = Liste.fetchRequest()
        //passer le descriptiof
        requete.entity = description
              //executer la requete
        do{
            let listeItems = try ctx.fetch(requete)
            liste = []
            for item in listeItems
            {
                var str = item.item! as String
                liste.append(str)
            }
            
        }catch let error
        {
            print (error.localizedDescription)
        }
        tableList.reloadData()
    }
    
    func refreshItemElements()
    {
        print("refreshing")
        let ctx = getContext()
        let description = NSEntityDescription.entity(forEntityName: "MapItem", in: ctx)!
        
        let requete : NSFetchRequest<MapItem> = MapItem.fetchRequest()
        //passer le descriptiof
        requete.entity = description
        //executer la requete
        do{
            let listeItems = try ctx.fetch(requete)

            for item in listeItems
            {
               
                var item = ExplorerItem(name: item.name!, phone: item.phone!, lat: item.lat, lng: item.lng)
                itemsList.append(item)
                print(item.name!)
           
            }
            
        }catch let error
        {
            print (error.localizedDescription)
        }
        tableList.reloadData()
    }
   // override func viewDidAppear(_ animated: Bool) {
     //        initialisation()
    //}
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
              // return liste.count
        print(itemsList.count)
        return itemsList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //   let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
       /* let cellule:homeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "homeCellule", for:indexPath) as! homeTableViewCell
        var item = liste[indexPath.row]
        cellule.etqNom.text = item
        print("size of list \(item) value")
 */

        let cellule:homeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "homeCellule", for:indexPath) as! homeTableViewCell
        var item = itemsList[indexPath.row]
        cellule.etqNom.text = item.name
        print("size of list \(item) value")
        
        return cellule
    }
    
    override func viewDidAppear(_ animated: Bool) {
        refreshItemElements()
    }

}
