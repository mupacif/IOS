//
//  Achat.m
//  14_protocole
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Achat.h"

@implementation Achat
{
    NSString* typeTVA;
    float prixHT;
}
-(id)initAvecPrixHT:(float)argPrixHT etTypeTVA :(NSString *)argTypeTVA
{
    self = [super init];
    if(self)
    {
        prixHT = argPrixHT;
        typeTVA = argTypeTVA;
    }
    return self;
}

-(NSString *)nomImpot
{
    return @"TVA(taxe sur la valeur ajouté";
}

-(float)calculerImpot
{
    if([typeTVA.lowercaseString isEqualToString:@"tva0"])
        return 0;
    else if([typeTVA.lowercaseString isEqualToString:@"tv2"])
        return prixHT*0.02f;
    else if([typeTVA.lowercaseString isEqualToString:@"tv5"])
        return prixHT*0.055f;
    else if([typeTVA.lowercaseString isEqualToString:@"tv20"])
        return prixHT*0.2f;
    else NSAssert(false,@"Type TVA erroné");
    
    return 0;
}
@end
