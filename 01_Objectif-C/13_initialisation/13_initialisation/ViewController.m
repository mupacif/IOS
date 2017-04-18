//
//  ViewController.m
//  13_initialisation
//
//  Created by etudiant on 4/14/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Personne.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //tentative
    @try {
        //Personne * p1 = [[Personne alloc]init];
        
        Personne * p1 = [Personne new];
        //new utilise toujours
        //l'initialisateur sans argument(ce qui limite son intéret)

    } @catch (NSException *exception) {
        NSLog(@"L'utilisation de l'initialisateur sans argument est interdite");
        NSLog(@"%@",exception.reason);
    }
    
    Personne* p3 = [[Personne alloc] initAvecNom:@"Durand" etAvecPrenom:@"Pierre"];
    
    [p3 afficherInfos];
    
    Personne *p4 = [[Personne alloc] initAvecAnneeNaissance:2017];

      [p4 afficherInfos];
    
    Personne *p5 =[[Personne alloc] initAvecCivilité:2 avecNom:@"dumbass"
        avecPrenom:@"jackass"
                                          etAvecAnneeNaissance:1990];
    
    [p5 afficherInfos];
    
   /* Personne*p6 =[[Personne alloc] initAvecNom:@"D"
                                  etAvecPrenom:@"Pierre"];
    
    if(p6)
        [p6 afficherInfos];
    else
        NSLog(@"p6 n'a pas été crée");*/
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
