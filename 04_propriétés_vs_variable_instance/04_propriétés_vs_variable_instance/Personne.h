//
//  Personne.h
//  04_propriétés_vs_variable_instance
//
//  Created by etudiant on 4/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Personne : NSObject
//définir une variable d'instance
//Les variables d'instance ne sont pas accessible
//à l'exterieure de la classe
//défini entre 2  accolades 
{
    BOOL estMariée;
}
//2 propriétés publiques
@property (nonatomic,strong) NSString * nom;
@property (nonatomic,strong) NSString * prenom;

-(void)tester;
-(void)testerAvecInitialisation;
@end
