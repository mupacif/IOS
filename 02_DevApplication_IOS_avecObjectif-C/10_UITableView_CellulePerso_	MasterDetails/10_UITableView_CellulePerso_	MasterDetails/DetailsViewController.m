//
//  DetailsViewController.m
//  10_UITableView_CellulePerso_	MasterDetails
//
//  Created by etudiant on 24/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgGateau;
@property (weak, nonatomic) IBOutlet UITextField *etqTitre;
@property (weak, nonatomic) IBOutlet UITextView *etqDescription;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.etqTitre.text = self.gateau.nom;
    self.etqDescription.text = self.gateau.texte;
    self.imgGateau.image = [UIImage imageNamed:self.gateau.nomImage];
}
- (IBAction)btnRetourTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
