//
//  ViewController.m
//  08_LacationEtLocationManagetr
//
//  Created by etudiant on 20/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import <Contacts/Contacts.h>
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
    if(!self.positionInitiale) //pas donnée
    {
        self.positionInitiale = newLocation;
    }
    
    CLLocationDistance distance = [newLocation distanceFromLocation:self.positionInitiale];
    
    NSString* distanceTxt = [[NSString alloc] initWithFormat:@"%f",distance];
    self.etqDistance.text = distanceTxt;
    
    
    
    
}
- (IBAction)btnRAZTouched:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
