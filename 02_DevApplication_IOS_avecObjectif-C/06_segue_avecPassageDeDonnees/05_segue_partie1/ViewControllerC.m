//
//  ViewControllerC.m
//  05_segue_partie1
//
//  Created by etudiant on 20/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewControllerC.h"

@interface ViewControllerC ()

@property (weak, nonatomic) IBOutlet UITextField *txtSaisie;
@end

@implementation ViewControllerC

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)btnRetourTouched:(id)sender {
    self.donneesRecu = self.txtSaisie.text;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.txtSaisie.text = self.donneesRecu;
}
-(NSString *)recupererDonneesSaisies
{
    return _txtSaisie.text;
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
