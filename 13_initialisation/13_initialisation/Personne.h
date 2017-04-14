//
//  Personne.h
//  13_initialisation
//
//  Created by etudiant on 4/14/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Personne : NSObject
@property (nonatomic) int civilite;
@property (nonatomic,strong) NSString* nom;
@property (nonatomic,strong) NSString* prenom;
@property (nonatomic) int anneeNaissance;

//définir les initialisateur à éxporter
//le nom d'un initialisatieur doit commencer par 'ini'
-(id) initAvecNom:(NSString *)nom etAvecPrenom:(NSString*)prenom;
-(id) initAvecAnneeNaissance:(int)aneeNaissance;
-(id) initAvecCivilité:(int)civilite
        avecNom:(NSString*)nom
        avecPrenom:(NSString*)prenom
        etAvecAnneeNaissance:(int)anneeNaissance;
@end
