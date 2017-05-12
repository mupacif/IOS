//
//  ViewController.swift
//  09_LocationetLocationManager
//
//  Created by etudiant on 12/05/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController , CLLocationManagerDelegate{

    @IBOutlet weak var etqLatitude: UILabel!
    @IBOutlet weak var etqLongitude: UILabel!
    @IBOutlet weak var etqAltitude: UILabel!
    @IBOutlet weak var etqPrecisionH: UILabel!
    
    @IBOutlet weak var etqPrecisionV: UILabel!
    @IBOutlet weak var etqAdresse: UILabel!
    @IBOutlet weak var etqDistance: UILabel!
    
    var locationManager: CLLocationManager?
    var positionPrecedente: CLLocation?
    var distanceTotaleParcourue: CLLocationDistance = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        etqLatitude.text = ""
        etqLongitude.text = ""
        etqAltitude.text = ""
        etqPrecisionH.text = ""
        etqAdresse.text = ""
        etqPrecisionV.text = ""
        etqDistance.text = "0"
        //récupérer une instance du service de localisation
        //qui tourne sur le dispositif
        
        locationManager = CLLocationManager()
        locationManager!.desiredAccuracy = kCLLocationAccuracyBest
        
        //lorsque le gestionnaire de position constate que la position de l'utilisateur a subit une modification
        //il appelle certaine méthode
        //imposer par le protocole CCLocationManagerDelegate
        
        //Si je veut être informé du changement de la position
        //je dois implémnter la/les methofes
        //qui m'intéressent
        //-informer le gestionnaire où se trouvent ces méthode
        locationManager!.delegate = self
        //demander l'autorisation
        locationManager!.requestWhenInUseAuthorization()
        //
        //démarrer le service de localisation
        locationManager!.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //méthode du protocole CCLocationManagerDelegate
    //qui est appellé lorsque la position courante
    //a change
    //comme la position a subi, peut-être, plusiers
    //changement cette métrhode un table de positions
    //de type CCLLocation
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        //récupérer la position la plus récente qui esy
        //la derniere du tableau passé en paramère
        let nouvellePosition = locations[locations.count - 1]
        
        //initialiser, si besoin, la valeur de la 
        //positionPrécedent
        if(positionPrecedente == nil)
        {
            positionPrecedente = nouvellePosition
        }
        
        //afficher les coordonnées de la position
        etqAltitude.text = 	String(format: "%.2f", nouvellePosition.altitude)
        
        etqLatitude.text = String(format: "%.6f", nouvellePosition.coordinate.latitude)
        
        etqLongitude.text = String(format: "%.6f", nouvellePosition.coordinate.longitude)
        
        etqPrecisionV.text = String(format: "%.2f", nouvellePosition.verticalAccuracy)
        
        etqPrecisionH.text = String(format: "%.2f", nouvellePosition.horizontalAccuracy)
        
        distanceTotaleParcourue += nouvellePosition.distance(from: positionPrecedente!)
        
        etqDistance.text = String(format: "%0.2f", distanceTotaleParcourue)
        
        positionPrecedente = nouvellePosition
        
        //récupérer et afficher l'adresse de chaque
        //nouvelle position
        //on utilise pour cela le service distant
        //CLGeocoder
        //créer une instance de ce service
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(nouvellePosition) { (tbPlacemarks, erreur) in
            
            if erreur != nil
                 {
                print("Erreur Geocoder: \(erreur!.localizedDescription)")
                return
            }
            
            if tbPlacemarks != nil && tbPlacemarks!.count > 0
            {
                //je me limite au premier placemark du tableau
                let placemark = tbPlacemarks![0]
                
                //récupération du dico
                if let dicoAdresses = placemark.addressDictionary
                {
                    self.etqAdresse.text = "\(dicoAdresses["Street"]!)" +
                    "\n\(dicoAdresses["ZIP"]!)" +
                    "\n\(dicoAdresses["City"]!)" +
                    "\n\(dicoAdresses["Country"]!)"
                }else
                {
                    self.etqAdresse.text = ""
                }
            }
        }
        
    }

    @IBAction func btnRAZdistance(_ sender: UIButton) {
        
        distanceTotaleParcourue = 0
        etqDistance.text = "0"
    }

}

