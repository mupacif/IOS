//
//  Utils.m
//  Incrementeur
//
//  Created by etudiant on 27/04/2017.
//  Copyright © 2017 -. All rights reserved.
//

#import "Utils.h"

@implementation Utils
+(void)afficherAlerteAvecTitre:(NSString*)titre etMessage:(NSString*)message etParent: (UIViewController*) controller
{
    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle:titre
                                message:message
                                preferredStyle:UIAlertControllerStyleAlert];
    //définir un bouton pour fermer l'alerte
    UIAlertAction* actionFermeture = [UIAlertAction
                                      actionWithTitle:@"fermer"
                                      style:UIAlertActionStyleCancel
                                      handler:nil];
    
    //afficher le bouton à l'alerte
    [alert addAction:actionFermeture];
    //afficher l'alerte
    [controller presentViewController:alert
                             animated:YES
                           completion:nil];
}
+(NSString *) hashString :(NSString *) data withSalt: (NSString *) salt {
    
    
    const char *cKey  = [salt cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [data cStringUsingEncoding:NSUTF8StringEncoding];
    unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSString *hash;
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", cHMAC[i]];
    hash = output;
    return hash;
    
}


+(NSString *) randomStringWithLength: (int) len {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    
    return randomString;
}

@end
