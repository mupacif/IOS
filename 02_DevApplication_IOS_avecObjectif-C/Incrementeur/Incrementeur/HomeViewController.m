//
//  HomeViewController.m
//  Incrementeur
//
//  Created by etudiant on 27/04/2017.
//  Copyright © 2017 -. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *loginTxt;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    self.loginTxt.text = self.textRecu;
}
- (IBAction)disconnectTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
