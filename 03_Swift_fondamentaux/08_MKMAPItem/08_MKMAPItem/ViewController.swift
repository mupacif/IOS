//
//  ViewController.swift
//  08_MKMAPItem
//
//  Created by etudiant on 12/05/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit
import CoreLocation
import Contacts
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var txtAdresse: UITextField!
    @IBOutlet weak var txtVille: UITextField!
    @IBOutlet weak var txtCP: UITextField!
    @IBOutlet weak var txtPays: UITextField!
    
    var coordonneesDestination : CLLocationCoordinate2D?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnAfficherTrajet(_ sender: UIButton) {
        
        let adresse = "\(txtAdresse.text!),\(txtCP.text!), \(txtVille.text!), \(txtPays.text!)"
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(adresse){
        (placemarks,erreur) in
            if erreur != nil{
                print("code erreur geocoder:\(erreur!.localizedDescription)")
            }
            else if placemarks != nil && placemarks!.count > 0
            {
                let placemark = placemarks![0]
                let location = placemark.location
                self.coordonneesDestination = location!.coordinate
                
                
                print("les coordonnées du premier point trouvé")
                print(" ")
                self.afficherMap()
            }
        }
        
    }
    
    func afficherMap()
    {
        //dictionnaire avec les clés spécifiques et avec les valeurs saisies
        let dicoAdresseDestination = [
            CNPostalAddressStreetKey: txtAdresse.text!,
            CNPostalAddressCityKey: txtVille.text!,
            CNPostalAddressPostalCodeKey: txtCP.text!,
            CNPostalAddressCountryKey: txtPays.text!]
        
        //réunir les coordonnées trouvées par le geocoder et les saisies dans un seul object
        let placemarkDestination = MKPlacemark(coordinate: coordonneesDestination!, addressDictionary: dicoAdresseDestination)
        
        //créer un objet de type MKMapItem
        let mkMapItem = MKMapItem(placemark: placemarkDestination)
        
        //PRéCISER DES éVENTUELLE OPTIONS DE PARCOUR
        // ces options doivent être données aussi dans un dictionnaire
        //avec des clés spécifiques
        let options = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
        
        
        mkMapItem.openInMaps(launchOptions : options)
        
        
    }


}

