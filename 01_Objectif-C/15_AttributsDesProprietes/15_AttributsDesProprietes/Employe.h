//
//  Employe.h
//  15_AttributsDesProprietes
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Voiture.h"
@interface Employe : NSObject
{
@public NSString* nom;
}

@property (nonatomic,strong) Employe* proprietaire;

@property (nonatomic,strong) Voiture* voiture;
-(void) configurerEmploye;
@end
