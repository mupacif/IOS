//
//  Achat.h
//  14_protocole
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PImposable.h"

@interface Achat : NSObject <PImposable>
-(id)initAvecPrixHT:(float)argPrixHT etTypeTVA :(NSString *)argTypeTVA;
@end
