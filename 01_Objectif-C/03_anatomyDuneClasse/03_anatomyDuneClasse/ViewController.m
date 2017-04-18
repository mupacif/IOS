//
//  ViewController.m
//  03_anatomyDuneClasse
//
//  Created by etudiant on 4/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
/*
 Entre @interface et @end je peux définir
 -des propriétés
 -des méthodes
 qui ne sont pas visible à l'extérieure de la classe
 */
@interface ViewController () //extention

@property(nonatomic, strong) NSString* automobile;

@end

/*
 
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"valeur de la propriété 'nom' avant initialisation est %@ %@ %@", self.nom, _nom,[self nom]);
    
    self.nom =@"andro";
    _nom=@"andro";
    [self setNom:@"andro"];
    
    NSLog(@"valeur de la propriété 'nom' après initialisation est %@ %@ %@", self.nom, _nom,[self nom]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
