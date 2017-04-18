//
//  Emplye.m
//  14_protocole
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Employe.h"

@implementation Employe
-(id)init
{
    NSAssert(false,@"Veuillez utiliser initAvecNom:etSalaure.");
    return nil;
}
-(id)initAvecNom:(NSString*)nom etSalaire:(float)salaire
{
    self = [super init]; //s'il y a assez de mémoire c'est nil
    if(self)
    {
        self.nom = nom;
        self.salaire = salaire;
    }
    return self;
}
@end
