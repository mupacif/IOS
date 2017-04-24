//
//  ViewController.m
//  09_MapView
//
//  Created by etudiant on 21/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "ResultatsRechercheViewContoller.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtRecherche;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UISlider *sliderRegion;

@property BOOL suivreUtilisateur;

@property (nonatomic) float coteRegion;

@property (nonatomic,strong) CLLocationManager* locationManager;

@property CLLocationCoordinate2D dernierePosition;

@property CLLocationCoordinate2D positionPassager;

@property (nonatomic) MKPointAnnotation *annotationPassager;
@property (weak, nonatomic) IBOutlet UITextField *textRecherche;

@property (nonatomic) MKCoordinateRegion region_a_afficher;

//Définir un tableau pour stoquer les résultats
//de la recherche (afin de pouvoir les envoyer vers le 2e controleur)
@property (strong, nonatomic)NSMutableArray* tbResultats;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //initialisations
    //je veux rendre ma map complétement transparente
    self.mapView.alpha = 0;
    self.suivreUtilisateur = YES;
    self.coteRegion = self.sliderRegion.value;
    
    //initialiser le type de la map au type standard
    
    self.mapView.mapType = MKMapTypeStandard;
    //créer le gestionnaire de localisation
    self.locationManager = [[CLLocationManager alloc] init];
    
    //déclarer que mon controleur est le délégue de la MapView
    self.mapView.delegate = self;
    //demander m'autorisation de connaitre la position de l'utilisateur
    [self.locationManager requestWhenInUseAuthorization];
    
    //demarrer m'autorisation de connaitre la position de l'utilisateur
    [self.locationManager startUpdatingLocation];
    
    //demander à la map d'afficher la position de l'utilisateur
    self.mapView.showsUserLocation = YES;
    
    //[self afficherMap];
}

- (IBAction)typeMapChanged:(UISegmentedControl*)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
}
- (IBAction)switchSuivreChanged:(UISwitch *)sender {
    self.suivreUtilisateur = [sender isOn];
}
- (IBAction)btnReturnClavierTouched:(UITextField *)sender {
    [sender resignFirstResponder];
    [self btnRechercherTouched:nil];
}
//interdir la transition si le tableau de sésultat ne contient rien
//pour cela on override la méthode
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    //comme on peut avoir plusieurs seque qui partent du
    //controleur , je dois (je devrais) tester quel est
    //lesegue passé en paramètre(effectivement cette méthode
    //est appelée pour tous les segué)

    //remarque: dans mon cas ce test n'est pas vraiment
    //nécessaire car il n,y a qu'un seul segue au depart
    //de ce controleur
    if([identifier isEqualToString:@"segueVersResultatRecherche"])
    {
        //je voudrais interdire cette transition
        //s'il n'y a pas de resultats à afficher
        if(self.tbResultats != nil && self.tbResultats.count>0)
        {
            return YES;
        }
        else{
            [self afficherAlerteAvecTitre:@"Afficher détails" etMessage:@"Il n'y a pas de resultats à détailler"];
            return  NO;
        }
    }else
        return YES;
}


-(void)afficherAlerteAvecTitre:(NSString*)titre etMessage:(NSString*)message
{
    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle:titre
                                message:message
                                preferredStyle:UIAlertControllerStyleAlert];
    //définir un bouton pour fermer l'alerte
    UIAlertAction* actionFermeture = [UIAlertAction
                                      actionWithTitle:@"fermer"
                                      style:UIAlertActionStyleCancel
                                      handler:nil];
    
    //afficher le bouton à l'alerte
    [alert addAction:actionFermeture];
    //afficher l'alerte
    [self presentViewController:alert
                       animated:YES
                     completion:nil];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // récupérer le destinataire de la transition
    ResultatsRechercheViewContoller* destinataire = (ResultatsRechercheViewContoller *)[segue destinationViewController];
    //j'ai passé les résultat au 2e écran.
    destinataire.itemsTrouves  = self.tbResultats;
}
- (IBAction)sliderRegionChanged:(UISlider *)sender {
    
    self.coteRegion = sender.value;
    
    [self afficherMap];
}
- (IBAction)btnRechercherTouched:(id)sender {
    //supprimer les placemarks de l'ancienne recherche
    [self.mapView removeAnnotations:[self.mapView annotations]];
    //supprimer le tableau contenant les résultats de
    //la recherche précédente
    self.tbResultats = nil;
    //je veux exécuter une recherche pour trouver
    //les endroits convenant à la saisie faire dans
    //txtRecherche
    
    //créer une requête de recherche
    MKLocalSearchRequest * requete =
    [[MKLocalSearchRequest alloc] init];
    //et lui passer la saisie
    requete.naturalLanguageQuery = self.textRecherche.text;
    
    //et la region de recherche aussi
    requete.region = _region_a_afficher;
    
    //créer un objet de recherche de type MKLocalSearch contenant la requête créee plus
    MKLocalSearch* recherche = [[MKLocalSearch alloc                                ] initWithRequest:requete];
    
    [recherche startWithCompletionHandler:^(MKLocalSearchResponse * _Nullable response, NSError * _Nullable error) {
        if(error)
        {
            NSLog(@"la recherche n'a pas aboutie, raison invoqué:%@",error);
            return;
        };
        
        //les itmes trouvés suite à la recherche sont déposés dans un tableua qui se trouve
        //dans l'argumenet 'response'
        
        //A-T-ON TROUVé QQC?
        if(response.mapItems.count ==0)
            NSLog(@"Aucun résultalt");
        else{
            //je veux stocker les éléments trouvé
            //dans tbRrdultats pour les transmettre
            //au 2e controlmeir
            //je crée ce tableau
            self.tbResultats = [[NSMutableArray alloc]init];
            //parcourir le tableau des items trouvés
            for(MKMapItem * item in response.mapItems)
            {
                [self.tbResultats addObject:item];
                //créer un MKPointAnnotation pour chaque item trouvé
                MKPointAnnotation* pointInteret = [[MKPointAnnotation alloc] init];
                pointInteret.coordinate = item.placemark.coordinate;
                pointInteret.title= item.name;
                
                //Lajouter la nouvelle annotation à la map
                [self.mapView addAnnotation:pointInteret];
            }
        }
    }];
    
    
}
-(void) afficherMap
{
    //récupérer la position de l'utilisateur
    // si son suivi a été demandé (si le boolean
    //suivreUtilisateur est vrai)
    if(self.suivreUtilisateur)
    {
        self.dernierePosition =CLLocationCoordinate2DMake(
                                                    self.mapView.userLocation.coordinate.latitude,
                                                self.mapView.userLocation.coordinate.longitude);
    }
    NSLog(@"dernière position connue: latitude: %f, longitude: %f",
          self.dernierePosition.latitude,
          self.dernierePosition.longitude);
    //créer une région dont le côté a été récupéré à partir
    //du slider
    self.region_a_afficher = MKCoordinateRegionMakeWithDistance(self.dernierePosition,
                                                                   self.coteRegion*1000,
                                                                   self.coteRegion*1000);
    //passer cette région à la map pour l'afficher
    [self.mapView setRegion:_region_a_afficher animated:YES];
    //rendre la map visible si elle ne l'est pas déjà
    if(self.mapView.alpha == 0)
    {
        self.mapView.alpha = 1;
    }
    
    //simuler et afficher la position d'un autre point mobile
    //pour voir les 2 positions en même temps, il faut calculer les données
    //du point mobile à partir des coordonnées
    //de l'utilisateur
    self.positionPassager = CLLocationCoordinate2DMake(self.mapView.userLocation.coordinate.latitude+0.005,
                                                       self.mapView.userLocation.coordinate.longitude - 0.003);
    
    
    //si une annotation a déjà été crée et afficher
    //la supprimer de la map
    if(self.annotationPassager)
        [self.mapView removeAnnotation:self.annotationPassager];
    //créer et afficher une annotation qui précise la position
    //du passager attendent le taxi
    
    self.annotationPassager = [[MKPointAnnotation alloc] init];
    [self.annotationPassager setCoordinate:self.positionPassager];
    [self.annotationPassager setTitle:@"Passager"];
    [self.annotationPassager setSubtitle:@"Pierre"];
    
    [self.mapView addAnnotation: self.annotationPassager];
    
    
   

}
//cette région à la map pour l'afficher
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation*)userLocation
{
    [self afficherMap];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
