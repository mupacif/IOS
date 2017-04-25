//
//  TrajetViewController.m
//  09_MapView
//
//  Created by etudiant on 24/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "TrajetViewController.h"
#import <MapKit/MapKit.h>
@interface TrajetViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *maMap;

@end

@implementation TrajetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //rendre la map transparente
    
    self.maMap.alpha = 0;
    //demander explicitement l'affichage de la position de l'utilisateur
    //car par defaut, la map ne l'affiche pas
    self.maMap.showsUserLocation = YES;
    //Déclarer que ce controleur est le délégué de la map
    //qu'il implémente certaines méthodes du protocole MKMapViewDelegate
    self.maMap.delegate = self;
}
//implémenter la méthode du protocol MKMapVieDelegate qui est appelée
//quand la position de l'utilisateur change
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
   //est-ce la première fois que la position de l'utilisateur a été récupérée?
    if(self.maMap.alpha == 0)
    {
        //définir un zoom initial à l'aide d'une région de
        //disons 2000mx2000m centrée sur la positon de
        //l'utilisateur passée en paramère
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude), 2000,2000);
        
        //passer la région à la map
        self.maMap.region = region;
        //Rendre la map opaque
        self.maMap.alpha=1;
        
        //demande à un serveur de calculer le trajet
        [self calculerTrajet];
        
    }else
        self.maMap.centerCoordinate = userLocation.coordinate;
    
}
-(void) calculerTrajet
{
    // créer une demande de calcul de trajet
    MKDirectionsRequest* demandeTrajet = [[MKDirectionsRequest alloc] init];
    
    //renseigner le point de départ
    // dans mon cas, le point de départ est la position de l'utilisateur
    demandeTrajet.source = [MKMapItem ];
}
- (IBAction)retourEcranPrecedentTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)bouttonRetourPremierEcranTouched:(id)sender {
}

- (IBAction)btnRecarculer:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
