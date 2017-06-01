//
//  ResultatsRechercheViewController.swift
//  11_MapViewAvecListeEtTrajet
//
//  Created by etudiant on 5/30/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit
import MapKit
class ResultatsRechercheViewController: UIViewController, UITableViewDataSource
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
    @IBAction func troisiemeEcranVersPremierEcran(segue:UIStoryboardSegue)
    {
        print("3 to 1  ")
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! TrajetViewController
        
        let indexPath = maTable.indexPathForSelectedRow!
        
        destination.destinationTrajet = itemTrouves[indexPath.row]
    }


    }
