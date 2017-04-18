//
//  Societe.h
//  15_AttributsDesProprietes
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Employe;

@interface Societe : NSObject
@property Employe* employe;
@property (nonatomic,weak) Employe* proprietaire;
@property (nonatomic, strong, getter=lireNom,setter=EcrireNom:) NSString* nomSociete;
-(void) configurerSociete;

@end
