//
//  ViewController.m
//  12_Heritage
//
//  Created by etudiant on 4/14/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Vehicule.h"
#import "VehiculeHybride.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Vehicule *ve = [[Vehicule alloc] init];
    ve.marque = @"Astom martin";
    
    //on peut aussi utiliser les setters
    [ve setModele:@"D10"];
    ve.cylindree = 6000;
    
    //afficher le contenu de l'object avec la méthode 'description'
    NSLog(@"%@",[ve description]);
    
    //l'appel explicit de la méthode 'descriptioné' n'est pas
    //obligatoire
    NSLog(@"%@",ve);
    
    NSLog(@"Vitesse maximum sur autoroute: %.0f",ve.vMaxAutoroute);
    
    [ve conduire];
    
    VehiculeHybride* vh = [[VehiculeHybride alloc] init];
    vh.marque = @"Tesla";
    vh.modele = @"S";
    vh.cylindree = 2000;
    vh.puissanceMoteurElectrique = 30;
    
    NSLog(@"%@", vh);
    
    //execute tester
    [vh tester];

    
    Vehicule *ve2 = vh;
    //le compilateur m'empêche d'utiliser la méthode
    // 'tester' d'un véhiocule hybride
    // [ve tester]
    
    //.. mais, au moment de l'éxecution, le lioen entre l'adresse
    //de l'object et son type est fait dynamiquement et le système
    // appelle la méthode de VehiculeHybride
    NSLog(@"%@",ve2);
    
    //si on vuet malgré tout appeler la méthode tester sur ve2
    //au moment du runtime, he dois utiliser un selecteur
    SEL monSelecteur = NSSelectorFromString(@"tester");
    [ve2 performSelector:monSelecteur];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
