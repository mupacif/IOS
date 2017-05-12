//
//  ViewController.swift
//  06_UITableView_CelllutePersonnalis"e
//
//  Created by etudiant on 11/05/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var imageTxt: UITextField!
    @IBOutlet weak var maTable: UITableView!
    @IBOutlet weak var titreTxt: UITextField!
    @IBOutlet weak var descriptionTxt: UITextField!
    var tbGateau:[Gateau] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Dire les méthode qui remplissent la table 
        //qui est la source de données
        //UITableViewDataSource
        maTable.dataSource = self
        //informer la table que les méthodes 
        //proposées par le procole UITableViewDelegate
        //sont implémenté ici,
        maTable.delegate = self
        
        tbGateau.append(Gateau(nom: "Méringe", nomImage: "meringue.jpg", description: "hohoho"))
        tbGateau.append(Gateau(nom: "Gateau au chocolat", nomImage: "gateauChocolat.jpg", description: "le plus délicieux"))
        tbGateau.append(Gateau(nom: "Tarte au peche", nomImage: "tartePeches.jpg", description: "hohoho"))
        tbGateau.append(Gateau(nom: "Tiramitsu", nomImage: "tiramisu.jpg", description: "N'hésitez plus"))
        
    }
    /**
    * implémenter les 3 methodes dont j'ai besoin et qui sont imposé par le procotol UITableViewDataSource
     //-la méthode qui retourne le nombre de sections
     //-la méthode qui retourne le nombre de lignes de la sections
     //-la méthode qui fournit et qui remplit la ligne
    */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tbGateau.count
    }
    
    @IBAction func addCellTouched(_ sender: UIButton) {
        
        var nom = titreTxt.text
        var description = descriptionTxt.text
        var img = imageTxt.text
        
        print("nom:\(nom), desc:\(description) img:\(img)")
    }
    // reutilise les élements de l'affichage
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pos = indexPath.row
        let gateau = tbGateau[pos]
        //récupérer une cellelue reutilisable
        let cell = tableView.dequeueReusableCell(withIdentifier: "maCellulePersonnalisée", for: indexPath) as! MaCellule
        
        cell.etqTitre.text = gateau.nom
        cell.etqDescription.text = gateau.description
        cell.imageGateau.image = UIImage(named: gateau.nomImage)
        
        return cell
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //récupérer l'index de la ligne selectionnées
        let idxLigneSelectionnee = maTable.indexPathForSelectedRow!.row
        let gateau = tbGateau[idxLigneSelectionnee]
        
        //récupérer l'ecran de destination à partir du segue
        let destination = segue.destination as! DetailsViewController
        
        destination.gateau_a_afficher = gateau
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idxLigneSelectionnee = maTable.indexPathForSelectedRow!.row
        
        let gateau = tbGateau[idxLigneSelectionnee]
        
       let panneauDetail = storyboard!.instantiateViewController(withIdentifier: "idControllerDetails") as! DetailsViewController
        
        panneauDetail.gateau_a_afficher = gateau
        
        present(panneauDetail, animated:  true,completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

