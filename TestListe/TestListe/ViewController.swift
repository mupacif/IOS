//
//  ViewController.swift
//  TestListe
//
//  Created by etudiant on 06/06/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var maTable: UITableView!

    var liste : [String] = []
    @IBOutlet weak var txtItem: UITextField!
    override func viewDidLoad() {
        
        maTable.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initialisation()
        txtDisplay.text =  recupererElements()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pos = indexPath.row
        let item = liste[pos]
        //récupérer une cellelue reutilisable
        let cell = tableView.dequeueReusableCell(withIdentifier: "maCellule", for: indexPath) as! Cellule
        
        cell.txtItem.text = item
   
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liste.count
    }
    
    @IBAction func btnRafraichirTouched(_ sender: UIButton) {
        txtDisplay.text = ""
        
        txtDisplay.text =  recupererElements()
    }
    
    @IBAction func btnAddItemTouched(_ sender: UIButton) {
        
        var item = txtItem.text!
        if item.characters.count > 0
        {
            txtDisplay.text = ""
            creerItem(item)
            
        }else
            
        {
            txtDisplay.text = "mot pas assez long"
        }
    }
    @IBOutlet weak var txtDisplay: UITextView!
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
            
            return
        }
    }
    func creerItem(_ item:String)
    {
        let context = getContext()
        
        //récupérer la descreiption de l'(entité adresse
        let description = NSEntityDescription.entity(forEntityName: "Liste", in: context)!
        
        let liste = Liste(entity: description, insertInto: context)
        liste.item = item
        
        do{
            try context.save()
            print("enregistrement item de liste")
          }catch let erreur
        {
            print("La sauvegarde des données a échoué\n")
        }

    }
    
    func recupererElements()-> String
    {
        let ctx = getContext()
        let description = NSEntityDescription.entity(forEntityName: "Liste", in: ctx)!
        
        let requete : NSFetchRequest<Liste> = Liste.fetchRequest()
        //passer le descriptiof
        requete.entity = description
        var txt = ""
        //executer la requete
        do{
            let listeItems = try ctx.fetch(requete)
            liste = []
                for item in listeItems
                {
                  txt += item.item! + "\n"
                    liste.append(item.item!)
                }
            
        }catch let error
        {
            print ()
        }
        maTable.reloadData()
        return txt

    }
    
    func getContext()-> NSManagedObjectContext
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

