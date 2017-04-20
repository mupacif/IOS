//
//  ViewController.m
//  07_MKMapItem
//
//  Created by etudiant on 20/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <Contacts/Contacts.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtAdresse;
@property (weak, nonatomic) IBOutlet UITextField *txtVille;
@property (weak, nonatomic) IBOutlet UITextField *txtCp;
@property (weak, nonatomic) IBOutlet UITextField *txtPays;

@property (nonatomic)CLLocationCoordinate2D coordonnesDepart;
@property (nonatomic)CLLocationCoordinate2D coordonnesDestination;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnAfficherTrajetTouché:(id)sender {
    //récuprer une instance du service de géolocalisation
    CLGeocoder* geocoder = [[CLGeocoder alloc] init];
    //Créer une chaine contenant l'adresse de destination
    NSString* addr = [NSString stringWithFormat:@"%@ %@ %@ %@", self.txtAdresse.text, self.txtVille.text, self.txtCp.text, self.txtPays.text];
    
    NSLog(@"%@", addr);
    
    //passer l'adresse obtenue à partir de la saisie au service
    //de géolocalisation
    [geocoder geocodeAddressString:addr completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        //analyseer l'argument error pour savoir
        if(error)
        {
            NSLog(@"Echec de service geocode avec erreur %@", error);
            return;
        }
        //si geocoder a trouvé une adresse ou plusieurs
        //qui corresponde à la saisie données, il les met
        //dans un tableau qui nous est fourni dans l'argument
        //placemarks
        //si aucune adresse n'a été trouvée, placemaks contient nil
        if(placemarks && placemarks.count>0)
        {
            // choisir la premiere adresse trouvée
            CLPlacemark* placemark = placemarks[0];
            
            //récupérer les coordonnées géographiques de cette adresse
            
            float latitude = placemark.location.coordinate.latitude;
            float longitude = placemark.location.coordinate.longitude;
            
            NSLog(@"latitude: %f, longitude: %f", latitude, longitude);
            
            self.coordonnesDestination = placemark.location.coordinate;
            
            [self afficherMap];
        }
    }
     
     ];
}

-(void) afficherMap
{
    //créer un dictionnaire qui doit contenir les informations
    //saisie (c'est mes informations du point d'arrivée)
    //(du placemark) de notre trajet
    //ce dictionaire possède des clès spécifiques:
    NSDictionary* dicoDestination = @{
                                      CNPostalAddressCityKey:self.txtVille.text,
                                      CNPostalAddressStreetKey:self.txtAdresse.text,
                                      CNPostalAddressPostalCodeKey:self.txtCp.text,
                                      CNPostalAddressCountryKey:self.txtPays.text};
    
    MKPlacemark* placemarkDestination = [[MKPlacemark alloc] initWithCoordinate:self.coordonnesDestination addressDictionary:dicoDestination];
    MKMapItem* mkMapItem = [[MKMapItem alloc] initWithPlacemark:placemarkDestination];
    //preciser des eventuelles options de parcours
    //ces options doivent être données aussi dans un dictionnaire
    //avec des clés spécifiques
    NSDictionary* dicoOptions = @{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving};
    
    [mkMapItem openInMapsWithLaunchOptions:dicoOptions];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
