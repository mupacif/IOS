//
//  ViewController.m
//  08_LacationEtLocationManagetr
//
//  Created by etudiant on 20/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *etqLatitude;
@property (weak, nonatomic) IBOutlet UILabel *etqLongitude;
@property (weak, nonatomic) IBOutlet UILabel *etqAltitude;
@property (weak, nonatomic) IBOutlet UILabel *etqPrecisionH;
@property (weak, nonatomic) IBOutlet UILabel *etqPrecisionV;
@property (weak, nonatomic) IBOutlet UILabel *etqAdresse;
@property (weak, nonatomic) IBOutlet UILabel *etqDistance;

@property (nonatomic,strong)CLLocationManager* locationManager;
@property (nonatomic, strong) CLLocation* positionCourante;
@property (nonatomic, strong) CLLocation* positionInitiale;
@property (nonatomic) CLLocationDistance distance;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [CLLocationManager new];
    
    //récupérer et afficher le niveau de  précision
    
    //définir le niveau de précision souhaité
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    //je veux overrider quelques méthodes des CLLocationManager
    //pour leur donner le code dont j'ai besoin
    //Ainsi faisant, ma classe ViewController devient un délégué(execute certaines taches par procuration)
    
    //Pour obtenir cette qualité de délégué de CLLocationManager
    //pour notre classe ViewController je dois
    //- déclarer que ma classe est confotrme au protocole qui contient
    // les méthodes en question
    //-déclarer que ma classest le délégué de l'object
    //locationManager
    
    self.locationManager.delegate = self;
    //demander à l'utilisateur la permission de connaitre sa position
    [self.locationManager requestWhenInUseAuthorization];
    
    //démarrer l'activité du gestionnauire de position
    [self.locationManager startUpdatingLocation];
}
//implémenter la méthode du protocole CCLocationManagerDelegate
//qui est appelé lorsque la protion de l'utilisateur a changé
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    //récupérer et afficher la latitude
    NSString* latitude = [[NSString alloc] initWithFormat:@"%.6f",newLocation.coordinate.latitude];
    self.etqLatitude.text = latitude;
    
    //récupérer et afficher la longitude
    NSString* longitude = [[NSString alloc] initWithFormat:@"%.6f",newLocation.coordinate.longitude];
    self.etqLongitude.text = longitude;
    
    
    
    NSString* altitude= [[NSString alloc] initWithFormat:@"%.6f",newLocation.altitude];
    self.etqAltitude.text = altitude;
    
    
    NSString* precisionH = [[NSString alloc] initWithFormat:@"%.6f",newLocation.horizontalAccuracy];
    self.etqPrecisionH.text = precisionH;
    
    
    NSString* precisionV = [[NSString alloc] initWithFormat:@"%.6f",newLocation.verticalAccuracy];
    self.etqPrecisionV.text = precisionV;
    
    //je dois m'assurer qu'une position initiale a été définie
   /* if(!self.positionInitiale) //pas donnée
    {
        self.positionInitiale = newLocation;
    }*/
    
    
    self.distance += [newLocation distanceFromLocation:oldLocation];
    if(self.distance <0)
        self.distance = 0;
        
    NSString* distanceTxt = [[NSString alloc] initWithFormat:@"%.0f",_distance];
    self.etqDistance.text = distanceTxt;
    
    //récupérer (si possible) une adresse à partir de la position
    //newLocation
    CLGeocoder* geocoder = [CLGeocoder new];
    [geocoder reverseGeocodeLocation:newLocation
                   completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                       if(error)
                       {
                           NSLog(@"Geocoder a échoué avec l'erreur %@", error);
                           return;
                       }
                       if(placemarks && placemarks.count >0)
                       {
                           CLPlacemark* placemark = placemarks[0];
                           //cet objet contient aussi bien le coordonnées
                           //geographique que l'adresse (n, voie, ville, pays)
                           //récupere ces information à l'aide d'un dictionnaire
                           
                           NSDictionary* dicoAvacLadresse = [placemark addressDictionary];
                           //afficher dictionnaire avec début description
                           //pour trouver les clés
                           //NSLog(@"%@", [dicoAvacLadresse debugDescription]);
                           //la sortie nous affiche un certain nombre de clés
                           //j'en retients les suuivants
                           //street, City, ZIP, country
                           
                           
                           //récupérer à partir de ce dictionnaire
                           //les composants de l'adresse
                           NSString* adresse = [dicoAvacLadresse objectForKey:/*CNPostalAddressStreetKey*/@"Street"];
                           
                           NSString* ville = [dicoAvacLadresse objectForKey:@"City"];
                           
                           NSString* cp = [dicoAvacLadresse objectForKey:@"ZIP"];
                           
                           
                           NSString* pays = [dicoAvacLadresse objectForKey:@"Country"];
                           
                           self.etqAdresse.text =
                           [NSString stringWithFormat:@"%@ %@ %@ %@", adresse, cp,
                            ville, pays];
                           
                       }
                
                           
                   }];
    
    
    
    
}
- (IBAction)btnRAZTouched:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
