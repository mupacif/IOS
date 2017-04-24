//
//  ViewController.m
//  14_protocole
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Personne.h"
#import "Employe.h"
#import "Achat.h"
@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   NSMutableArray * registre = [NSMutableArray new];
    Personne * p = [Personne new];
    p.nom = @"Marie";
    
   NSLog(@"%@", p);
    [registre addObject:p];
    
    Employe* e = [[Employe alloc] initAvecNom:@"Pacifique" etSalaire:3000];
    
   [registre addObject:e];
    
 Achat * a = [[Achat alloc] initAvecPrixHT:100 etTypeTVA:@"tva20"];
   [registre addObject:a];/**/
    

   float recette = 0;
    float impotItem=0;
    for(NSObject* item in registre)
    {
        if([item conformsToProtocol:@protocol(PImposable)])
        {
            impotItem =((id<PImposable>)item).calculerImpot;
            NSLog(@"Type impot:%@, montant: %f", ((id<PImposable>)item).nomImpot,impotItem);
                  
                  recette+= impotItem;
        }
    }
    NSLog(@"La recette totale du fisc: %0.2f",recette);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
