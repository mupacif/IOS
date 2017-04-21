//
//  Gateau.m
//  10_UITableView_CellulePerso_	MasterDetails
//
//  Created by etudiant on 21/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Gateau.h"

@implementation Gateau
-(id)initNom:(NSString*)nom nomImage:(NSString*)nomImage description:(NSString*)description
{
    if(self = [super init])
    {
    self.nomImage = nomImage;
    self.nom = nom;
    self.texte= description;
    }
    return self;
}
@end
