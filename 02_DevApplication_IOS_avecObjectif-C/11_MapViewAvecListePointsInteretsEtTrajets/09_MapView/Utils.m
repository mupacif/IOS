//
//  Utils.m
//  09_MapView
//
//  Created by etudiant on 25/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
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
@end
