//
//  InformationsViewController.m
//  09_MapView
//
//  Created by etudiant on 25/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "InformationsViewController.h"

@interface InformationsViewController ()
@property (weak, nonatomic) IBOutlet UITextView *txtInformations;

@end

@implementation InformationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* txt = @"";
    
    //concaténé tous les items (les informations)
    //du tableau etles sépraer par un passage à la ligne
    for(NSString* item in self.tbInformations)
    {
        txt=[NSString stringWithFormat:@"%@\n%@",txt,item];
    }
    
    self.txtInformations.text = txt;
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
