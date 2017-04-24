//
//  ResultatsRechercheViewContoller.h
//  09_MapView
//
//  Created by etudiant on 24/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultatsRechercheViewContoller : UIViewController <UITableViewDataSource>
@property(strong,nonatomic) NSMutableArray* itemsTrouves;
@end
