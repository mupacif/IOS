//
//  ViewController.swift
//  11_MapViewAvecListeEtTrajet
//
//  Created by etudiant on 5/29/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate {

    var suivreUtilisateur = true;
    
    var coteRegion: Float?
    var locationManager: CLLocationManager?
    var locationCordinate: CLLocationCoordinate2D?
    var autrePointMobile: CLLocationCoordinate2D?
    var dernierePosition: CLLocationCoordinate2D?
    
    var autrePositionPointMobile: CLLocationCoordinate2D?
    var annotationAutrePointMobile: MKPointAnnotation?
    
    var region_a_afficher:MKCoordinateRegion?
    
    var tbResultats: [MKMapItem] = []

    @IBAction func cacherClevierVisuel(_ sender: UITextField) {
        sender.resignFirstResponder()
        btnRechercherTouched(sender)
    }
    
    @IBAction func btnRechercherTouched(_ sender: Any?) {
        
        //sender.resignFirstResponder()
        //Supprimer les anciens placemarks 
        
        mapView.removeAnnotations(mapView.annotations)
        tbResultats = []
        
        //créer une requête de recherche 
        let requete = MKLocalSearchRequest()
        
        requete.naturalLanguageQuery = txtRecherche.text
        
        //et la region de recherche aussi
        requete.region = region_a_afficher!
        
        //créer un objet de recherche de type MKLocalSearch
        //la requête créee plus
        
        let recherche = MKLocalSearch(request: requete)
        
        recherche.start{ (laReponse,erreur) in
        //tester si une erreur a été rencontrée
        if(erreur != nil)
        {
        print("La recherche n'a pas abouti. raison : \(erreur?.localizedDescription)")
            return
            }
            
            if laReponse != nil && laReponse!.mapItems.count == 0
      
            {
                print("aucun resultat")
            }
            else{
                for item in laReponse!.mapItems
                {
                    self.tbResultats.append(item)
                    
                    let pointInteret = MKPointAnnotation()
                
                    pointInteret.coordinate = item.placemark.coordinate
                    
                    pointInteret.title = item.name
                    pointInteret.subtitle = item.phoneNumber
                    
                    self.mapView.addAnnotation(pointInteret)
                    
                }
                
                }
        }
        
        
    }
    
    @IBOutlet weak var txtRecherche: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var sliderRegion: UISlider!
    
    @IBAction func typeMapChanged(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapType.standard;
            break;
        case 1:
            self.mapView.mapType = MKMapType.satellite;
            break;
        case 2:
            self.mapView.mapType = MKMapType.hybrid;
            break;
            
        default:
            break;
        }
        
    }
    
    @IBAction func sliderRegionChanged(_ sender: UISlider) {
        coteRegion = sender.value
        afficherMap()
    }
    @IBAction func switchSuivreChanged(_ sender: UISwitch) {
        suivreUtilisateur = sender.isOn
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //rendre ka lap complètement transparente
        mapView.alpha = 0;
        //récupération à partir de la valeur initiale du coté de la région affiché
        coteRegion = sliderRegion.value;
        
        //initialiser le type de la carte
        mapView.mapType = MKMapType.standard
        
        //créer le gestionnaire de la localisation
        locationManager = CLLocationManager();
        
        //Déclarer que mon controleur est le délégué de la mapView
        mapView.delegate = self
        
        //demander l'autorisation de connaitre la position de l'utilisateur
        locationManager!.requestWhenInUseAuthorization()
        //demarrer le gestionnaire de localisation
        locationManager!.startUpdatingLocation()
        
        //demander à la map d'afficher la position de l'utilisateur
        mapView.showsUserLocation = true
        
        
    }

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation)
    {
        afficherMap();
    }

    func afficherMap()
    {
        
            //récupérer la position de l'utilisateur
            // si son suivi a été demandé (si le boolean
            //suivreUtilisateur est vrai)
            if(self.suivreUtilisateur)
            {
                dernierePosition = CLLocationCoordinate2DMake(
                    mapView.userLocation.coordinate.latitude,
                    mapView.userLocation.coordinate.longitude);
            }
        
        print("dernière position connue: latitude:\(dernierePosition!.latitude)\n longitude:\(dernierePosition!.longitude)")
        
        //créer une région dont le côté à été récupérer à partir du slider
        region_a_afficher = MKCoordinateRegionMakeWithDistance(dernierePosition!, CLLocationDistance(coteRegion!*1000), CLLocationDistance(coteRegion!*1000))
        
        //passer cette région à la map pour l'afficher 
        
        mapView.setRegion(region_a_afficher!, animated: true)
        
        //simuler et afficher la position d'un autre point mobile
        //pour voir les 2 positions en même temps, il faut calculer les données
        //du point mobile à partir des coordonnées
        //de l'utilisateur
        autrePointMobile = CLLocationCoordinate2DMake(mapView.userLocation.coordinate.latitude+0.005,
                                                           mapView.userLocation.coordinate.longitude - 0.003);
    
        
        if(annotationAutrePointMobile != nil)
        {
            mapView.removeAnnotation(annotationAutrePointMobile!)
        }
        
        //créer et afficher une anotation qui précisse la prosition 
        //du passager attendent le taxi
        
        annotationAutrePointMobile = MKPointAnnotation()
        
        annotationAutrePointMobile!.coordinate =  autrePointMobile!
        
        annotationAutrePointMobile!.title = "Passager"
        annotationAutrePointMobile!.subtitle = "Pierre"
        
        mapView.addAnnotation(annotationAutrePointMobile!)
        
        //rendre la map visible si elle ne l'est pas pas déjà
        if(mapView.alpha == 0)
        {
            mapView.alpha = 1
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender:Any?)
    {
        let destinataire = segue.destination as! ResultatsRechercheViewController
        
        destinataire.itemTrouves = tbResultats
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if tbResultats.count > 0
        {
            return true;
        }
        else
        {
            let alert = UIAlertController(title: "Afficher détails", message: "Il n'y a rien à détailler", preferredStyle : UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title:"fermer",style:UIAlertActionStyle.default, handler:nil))
            
            present(alert,animated: true, completion: nil)
            
            return false

        }
                }


}

