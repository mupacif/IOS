//
//  TrajetViewController.swift
//  11_MapViewAvecListeEtTrajet
//
//  Created by etudiant on 5/30/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit
import MapKit
class TrajetViewController: UIViewController, MKMapViewDelegate {

    @IBAction func btnRetourTouched(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var maMap: MKMapView!
    @IBAction func btnRecalculerTrajetTouched(_ sender: UIBarButtonItem) {
        calculerTrajet()
    }
    var destinationTrajet: MKMapItem?
    
    var tbInstructions : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maMap.alpha = 0
        
        maMap.showsUserLocation = true
        maMap.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func mapView(_ mapViex:MKMapView, didUpdate userLocation: MKUserLocation)
    {
        if(self.maMap.alpha == 0)
        {
            //définir un zoom initial à l'aide d'une région de
            //disons 2000mx2000m centrée sur la positon de
            //l'utilisateur passée en paramère
            let region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude), 2000,2000);
            
            //passer la région à la map
            self.maMap.region = region;
            //Rendre la map opaque
            self.maMap.alpha=1;
            
            //demande à un serveur de calculer le trajet
            maMap.alpha = 1
            calculerTrajet();
        }
            else
            {
                    maMap.centerCoordinate = userLocation.coordinate;
    
            }
    }
    
    func calculerTrajet()
    {
        //supprimer tous les trajts
        supprimerTousLesTrajets();
        
        //créer une demande de calcul
        let demandeTrajet = MKDirectionsRequest()
        
        //définir le point de départ
        //dans mon cas, le point de départ est la position de  l'utilisateur
        
        demandeTrajet.source = MKMapItem.forCurrentLocation()
        //definir le point d'arrivé à partir de l'écran précédent
        demandeTrajet.destination = destinationTrajet
        
        
        demandeTrajet.requestsAlternateRoutes = false
        let directions = MKDirections(request: demandeTrajet)
        
        directions.calculate{
            (argTrajet,argErreur) in
                if argErreur != nil
            {
            print("Le calcul du trajet a échoué, erreur invoquée:\(argErreur?.localizedDescription)")
            }
                else{
                    self.afficherTrajet(argTrajet!)
                    }
          
        }
    }

    func afficherTrajet(_ trajet: MKDirectionsResponse)
    {
        var nb = 1
        for route in trajet.routes{
            maMap.add(route.polyline, level: MKOverlayLevel.aboveRoads)
            //dessiner le trajet enrre la rue et l"étiquette contenant le nom de la rue 
            for etape in route.steps
            {
                //déposer les instructions pour chaque étape
                //dans le tabelau d'instructions
                tbInstructions.append("\(nb+=1),\(etape.instructions)")
             
            }
        }
    }
    
    //méthode du protocole
    func mapView(_ mapView:MKMapView, rendererFor argOverLay:MKOverlay)-> MKOverlayRenderer
    {
        let renduGraphique = MKPolylineRenderer(overlay: argOverLay)
        
        renduGraphique.strokeColor = UIColor.blue
        renduGraphique.lineWidth = 5.0
        
        return renduGraphique
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func supprimerTousLesTrajets()
    {
                for couche_a_supprimer in self.maMap.overlays
                {
                    //tester si la couche courante est celle qui
                    //affiche les trajets(les polylines) et
                    //la supprimer
                    if couche_a_supprimer is MKPolyline
                    {
                        maMap.remove(couche_a_supprimer)
                    }
            }
        
        //vider le tableau d'instuctions
        tbInstructions = [] 
    }
    
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination
        
        if destination is InstuctionViewController
        {
        //récupérer l'écran de destination
        let destination = segue.destination as! InstuctionViewController
        
        destination.tbInformations = tbInstructions
        }
        
 
    }


}
