//
//  Vehicule.h
//  12_Heritage
//
//  Created by etudiant on 4/14/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehicule : NSObject
//strong non destruction en mémoire
//nonatomic pour éviter que 2 threads modifier en même temps
@property (nonatomic, strong) NSString* marque;
@property (nonatomic, strong) NSString* modele;
@property (nonatomic) float cylindree;

@property (nonatomic, readonly) float vMaxAutoroute;
-(void) conduire;
@end
