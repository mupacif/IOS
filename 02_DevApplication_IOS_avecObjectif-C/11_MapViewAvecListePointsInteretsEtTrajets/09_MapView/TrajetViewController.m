//
//  TrajetViewController.m
//  09_MapView
//
//  Created by etudiant on 24/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "TrajetViewController.h"
#import <MapKit/MapKit.h>
#import "Utils.h"
@interface TrajetViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *maMap;
@property (strong, nonatomic) NSMutableArray* tbInformations;
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
    //supprimer tous les trajets
    [self supprimerTousLesTrajets];
    // créer une demande de calcul de trajet
    MKDirectionsRequest* demandeTrajet = [[MKDirectionsRequest alloc] init];
    
    //renseigner le point de départ
    // dans mon cas, le point de départ est la position de l'utilisateur
    demandeTrajet.source = [MKMapItem mapItemForCurrentLocation];
    
    //définir le point d"arrivé
    demandeTrajet.destination = self.destinationTrajet;
    
    //afficher ou ne pas afficher les routes altérnatives
    demandeTrajet.requestsAlternateRoutes = NO;
    
    //créer et intégrer dans la demande un object qui contendra les informations
    //sur le trajet
    MKDirections* directions = [[MKDirections alloc] initWithRequest:demandeTrajet];
    
    //executer la requête (envoyer la demande)
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
        //
        if(error)
        {
            [Utils afficherAlerteAvecTitre:@"Calculer trajet"
                                 etMessage:[NSString stringWithFormat:@"le calcul du trajet a echoué, raison invoquée:%@",error]
                                  etParent:self];
        }
        else
            [self afficherTrajet:response];
    }];
    
}
-(void) supprimerTousLesTrajets
{
    for(id<MKOverlay> couche in self.maMap.overlays)
    {
        //tester si la couche courante est celle qui
        //affiche les trajts(les polylines)
        //et la supprimer
        if([couche isKindOfClass:[MKPolyline class]])
        {
            [self.maMap removeOverlay:couche];
        }
    }
}
-(void)afficherTrajet: (MKDirectionsResponse *) trajet
{
    //afficher les étapes de la route
    self.tbInformations = [[NSMutableArray alloc] init];
    //sur 1er route
    int nb = 1;
    
    for(MKRoute* route in trajet.routes)
    {
        //une route est un ensemble de segments(polyline)
        //ces segmets doivent être passés à la map
        [self.maMap addOverlay:route.polyline level:MKOverlayLevelAboveLabels];
    //dessinne sur la rue level:MKOverlayLevelAboveLabels
        for(MKRouteStep* etape in route.steps)
        {
            
            [self.tbInformations addObject:[NSString stringWithFormat:@"%i. %@",nb++,etape.instructions]];
        }
        NSLog(@"%@",[self.tbInformations debugDescription]);
        //remarqie: les instructions obtenus sont en anglais
        //pour tenir compte de la locale du téléphone(et donc
        //afficher ces informations en françiasà je dois:
        //-modifier le fichier de configutation de l'application
        // info.plist
        //en clai, il faut ajouter la propriété
        //
        //-congigurer la locale du telephone
        // settings->general->Language&Region-> Other Languages >french -> done'
        //-> cliquer change to french
        //
    }
}
//on utilise la méthode suivante définie par le protocole
//MKMapViewDelegate poru retourner l'object qui sera utilisé par le système
//pour afficher (pour dessiner) le trajet
-(MKOverlayRenderer*)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    //créer le rendeur graphique pour la couche(overlay) passée
    //en paramètre
    MKPolylineRenderer* renduGraphique
    =[[MKPolylineRenderer alloc] initWithOverlay:overlay];
    
    //configurer le rendeur
    renduGraphique.strokeColor = [UIColor blueColor];
    renduGraphique.lineWidth = 5.0;

    return renduGraphique;
}
- (IBAction)retourEcranPrecedentTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)bouttonRetourPremierEcranTouched:(id)sender {
}

- (IBAction)btnRecarculer:(id)sender {
    [self calculerTrajet];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
