//
//  Utils.h
//  Incrementeur
//
//  Created by etudiant on 27/04/2017.
//  Copyright © 2017 -. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonHMAC.h>
@interface Utils : NSObject
+(void)afficherAlerteAvecTitre:(NSString*)titre etMessage:(NSString*)message etParent: (UIViewController*) controller;
+(NSString *) hashString :(NSString *) data withSalt: (NSString *) salt;
+(NSString *) randomStringWithLength: (int) len;
@end
