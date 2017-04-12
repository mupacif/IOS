//
//  Personne.m
//  04_propriétés_vs_variable_instance
//
//  Created by etudiant on 4/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Personne.h"

@implementation Personne
-(void) tester
{
 
    //propriété  'nom' en écriture
    self.nom = @"Pacifique";
    //utiliser la variable d'instance créée par le compilateur
    _nom = @"yolo";
    
    //
    NSString * nom = self.nom;//[self nom]
    
    estMariée = NO;

    NSLog(@" self.nom: %@,self.prenom: %@,estMariée: %i,nom: %@ ",self.nom,self.prenom,estMariée,nom); //%i : entier %d est pour les décimal
}
@end
