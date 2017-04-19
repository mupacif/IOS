//
//  ViewController.m
//  04_firstResponder
//
//  Created by etudiant on 4/19/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txt1;
@property (weak, nonatomic) IBOutlet UITextField *txt2;

@end

@implementation ViewController
- (IBAction)btnCacherClavierTxt1:(id)sender {
    [self.txt1 resignFirstResponder];
}
- (IBAction)btnCacherClavierTxt2:(id)sender {
    [self.txt2 resignFirstResponder];
}
- (IBAction)btnFocusSurTxt:(id)sender {
    [self.txt2 becomeFirstResponder];
}
//donner la possibilité à l'utilisateur de faire
//disparaitre le clavier visuel
//en touchant la partie livre de l'écran

//pour cela, je dois overrider la méthodes
//touches Began et arrêter l'édition en cours
//(où qu'elle soit)
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
