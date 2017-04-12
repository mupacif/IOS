//
//  Automobile.m
//  05_GettersEtSetters
//
//  Created by etudiant on 4/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Automobile.h"

@implementation Automobile
/*
 Filtrer les entrées(valeur de l'odometre)
 rappel: lors de la déclaration de la propriété, le compilateur génère automatiquement un setter et un getter
 mais n'assure pas la l'extérieur
 */
-(void)setOdometre:(long)kilometrage
{
	if(kilometrage>_odometre)
    {
        _odometre = kilometrage;
    }
    NSLog(@"nouvelle valeur de l'odometre: %li",_odometre);
}
@end
