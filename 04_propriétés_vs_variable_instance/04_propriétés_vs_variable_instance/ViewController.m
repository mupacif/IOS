//
//  ViewController.m
//  04_propriétés_vs_variable_instance
//
//  Created by etudiant on 4/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Personne.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Créer une personne
    Personne * personne1 = [[Personne alloc] init];
    // donner un nom et un prénom à cette personne
    //en utilisant
    //- soit la propriété directe
    //-soit son setter
    [personne1 setPrenom:@"Jean Clause"];
    personne1.nom = @"Van Damme";
    
    //peut-on utiliser une variable d'instance estMariée?
    //self._prenom = @"fufu";
    
    //utiliser la methode tester
    [personne1 testerAvecInitialisation];
    
    Personne * personne2 = [[Personne alloc] init];
    [personne2 tester];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
