//
//  Employe.m
//  15_AttributsDesProprietes
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Employe.h"

@implementation Employe
{
//un autre champ d'instance(privé
    NSString* prenom;
}

//le nom de la variable sur laquelle s'appuie la propriété
//voiture est _voiture
//si on vuet changer cela, on utilise la firective
@synthesize voiture = une_voiture;

-(void) configurerEmploye
{
   // self.voiture = [[Voiture alloc] init];
    
    une_voiture = [[Voiture alloc] init];
    //Configurer la voiture (c'est à dire préciser son propriétaire)
    self.voiture.proprietaire = self; //le propriéraire de la voiture est l'employé
    nom = @"Dupont";
    prenom = @"Marie";
    
}
-(void)dealloc
{
    NSLog(@"L'employé a été supprimé de la mémoire");
}
@end
