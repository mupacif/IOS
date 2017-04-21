//
//  maCellule.h
//  10_UITableView_CellulePerso_	MasterDetails
//
//  Created by etudiant on 21/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface maCellule : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgGateau;
@property (weak, nonatomic) IBOutlet UILabel *etqTitre;
@property (weak, nonatomic) IBOutlet UILabel *etqDescription;
@end
