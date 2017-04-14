//
//  Vehicule.m
//  12_Heritage
//
//  Created by etudiant on 4/14/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Vehicule.h"
@interface Vehicule()
//propriété dont le scope est privée
@property(nonatomic) float vitesse;

//méthode dont le scop est privé
-(void) acceler:(float) deltaVitesse;

@end
@implementation Vehicule
-(id) init
{
    self = [super init];
    if(self)
    {
        _vMaxAutoroute = 130;
        
        self.vitesse = 0;
    }
    return self;
}
//méthode exporté 'conduire'
-(void)conduire
{
    NSLog(@"Je conduits ma %@, %@ de %,0f cm3",
          self.marque,
          self.modele,
          self.cylindree);
    [self acceler:40];
    NSLog(@"Je roule à %.0f km/h", self.vitesse);
}
//implémenter la méthode local acceler
-(void) acceler:(float)deltaVitesse
{
    self.vitesse += deltaVitesse;
    if(self.vitesse <0)
        self.vitesse=0;
    
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@, de %.0f cm3",
            self.marque,
            self.modele,
            self.cylindree];
}
@end
