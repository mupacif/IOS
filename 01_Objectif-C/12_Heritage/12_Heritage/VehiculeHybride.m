//
//  VehiculeHybride.m
//  12_Heritage
//
//  Created by etudiant on 4/14/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "VehiculeHybride.h"

@implementation VehiculeHybride
-(id)init
{
//appel classe générale
   if(self=[super init])
   {
       NSLog(@"le super init a réussi");
       self.puissanceMoteurElectrique = 20;
   }

    
    return self;
}
-(void) tester{
    NSLog(@"Je vérifier l'état des batteries");
    [self conduire];
}

-(void)  conduire
{
    NSLog(@"Je charges les batteries");
    [super conduire];
    NSLog(@"et %.0f kW",self.puissanceMoteurElectrique);
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ et %.0f kW",
            [super description], self.puissanceMoteurElectrique];
}


@end
