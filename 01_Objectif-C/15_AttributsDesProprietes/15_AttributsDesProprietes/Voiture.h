//
//  Voiture.h
//  15_AttributsDesProprietes
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
//n'a pas encoré été implémenté
//#import "Employe.h"

//on peut éventuellement utiliser
@class Employe;
@interface Voiture : NSObject
//Strong : la référence sur l'employé est forte,
//ce qui implique que l'employé reférencé ne peut pas être supprimé'
//le garbage collector n'arrivera jamais ici
//nonatomic : plusieurs thread peuvent l'utiliser en même temps
@property(nonatomic,strong) Employe* proprietaire;
@end
