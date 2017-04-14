//
//  Personne.m
//  13_initialisation
//
//  Created by etudiant on 4/14/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Personne.h"

@implementation Personne
-(id) initAvecNom:(NSString *)nom etAvecPrenom:(NSString *)prenom
{
    if(self=[super init])
    {
        self.nom = nom;
        self.prenom = prenom;
    }
    return self;
}
@end
