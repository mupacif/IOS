//
//  PImposable.h
//  14_protocole
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//
#import <Foundation/Foundation.h>
@protocol PImposable <NSObject>
-(float) calculerImpot;
@property (readonly) NSString* nomImpot;
@end
