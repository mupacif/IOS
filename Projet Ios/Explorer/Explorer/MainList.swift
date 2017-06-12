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
class MainList: UIViewController, UITableViewDataSource {

 
    var liste:[String]=[]
    @IBOutlet weak var tableList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    initialisation()
tableList.dataSource = self
        // Do any additional setup after loading the view.
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
            refreshElements()
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
    
    func creerItem(_ item:String)
    {
        let context = getContext()
        //récupérer la descreiption de l'(entité adresse
        let description = NSEntityDescription.entity(forEntityName: "Liste", in: context)!
        
        let elt = Liste(entity: description, insertInto: context)
        elt.item = item
        
        do{
            try context.save()
            print("enregistrement item de liste")
        }catch let erreur
        {
            print("La sauvegarde des données a échoué\n")
        }
        refreshElements()
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
                print("\(str) listed")
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
        return liste.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //   let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let cellule:homeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "homeCellule", for:indexPath) as! homeTableViewCell
        var item = liste[indexPath.row]
        cellule.etqNom.text = item
        return cellule
    }

}
