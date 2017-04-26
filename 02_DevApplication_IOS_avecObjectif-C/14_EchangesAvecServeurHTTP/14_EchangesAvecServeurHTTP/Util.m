//
//  Util.m
//  14_EchangesAvecServeurHTTP
//
//  Created by etudiant on 26/04/2017.
//  Copyright © 2017 -. All rights reserved.
//

#import "Util.h"

@implementation Util
+(NSString*) jsonifierObject:(id)object
{
    NSError* erreur = nil;
    NSData* jsonData;
    @try {
        jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted
            error:&erreur];
        //est-ce que la jsonification a reussi?
        if(erreur != nil)
        {
            NSLog(@"Une erreur a été rencontré\n%@",erreur);
            return nil;
        }
        //transformer les codes contenus dans l'objet jsonData
        //en chaine de caractères
        NSString* jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonString;
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.name); //type de l'exception
        NSLog(@"%@",exception.reason); // les
        NSLog(@"seulement les dictionnaires et les tableaux"
              "des dictionnaires sont jsonfiables");
        return nil;
    }
    return nil;
}
@end
