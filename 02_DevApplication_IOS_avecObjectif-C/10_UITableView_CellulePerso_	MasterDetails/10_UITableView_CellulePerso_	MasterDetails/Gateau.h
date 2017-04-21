//
//  Gateau.h
//  10_UITableView_CellulePerso_	MasterDetails
//
//  Created by etudiant on 21/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gateau : NSObject
@property (nonatomic,strong)NSString* nomImage;
@property (nonatomic,strong)NSString* nom;
@property (nonatomic,strong)NSString* texte;

-(id)initNom:(NSString*)nom
    nomImage:(NSString*)nomImage
    description:(NSString*)description;
@end
