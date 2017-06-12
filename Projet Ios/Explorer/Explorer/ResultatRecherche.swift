//
//  ResultatRecherche.swift
//  Explorer
//
//  Created by Etudiant on 09/06/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit
import MapKit
import CoreData
class ResultatRecherche: UIViewController ,UITableViewDataSource
{
    
    @IBAction func btnRetourTouched(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var maTable: UITableView!
    
    var itemTrouves : [MKMapItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        maTable.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemTrouves.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //   let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let cellule:CellulePersonnalisee = maTable.dequeueReusableCell(withIdentifier: "celluleResultat", for:indexPath) as! CellulePersonnalisee
        var item = itemTrouves[indexPath.row]
        cellule.etqNom.text = item.name
        cellule.etqTelephone.text = item.phoneNumber
        return cellule
    }

    

    @IBAction func saveSelectedRow(_ sender: Any) {
        let indexPath = maTable.indexPathForSelectedRow!
        var item = itemTrouves[indexPath.row]
        
        //destination.destinationTrajet = itemTrouves[indexPath.row]
        creerItem(item.name!)
        print("enregistrement fait")

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
            print("\(item) enregistrée")
            try context.save()
            print("enregistrement item de liste")
        }catch let erreur
        {
            print("La sauvegarde des données a échoué\n")
        }

    }
    
}
