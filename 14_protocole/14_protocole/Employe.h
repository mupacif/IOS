//
//  Emplye.h
//  14_protocole
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Personne.h"
#import "PImposable.h"
@interface Employe : Personne <PImposable/*,P1,p2*/>
@property float salaire;

-(id) initAvecNom:(NSString*)nom etSalaire:(float) salaire;
@end
