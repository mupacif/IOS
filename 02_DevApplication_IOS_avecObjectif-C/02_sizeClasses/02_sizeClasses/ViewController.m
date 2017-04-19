//
//  ViewController.m
//  02_sizeClasses
//
//  Created by etudiant on 4/19/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//intercepete les évenement levé âr la rotation
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    //si on ne veut savoir quelle est la nouvelle présentation je dois utiliser
    //le coordinateur comme suit
    [coordinator animateAlongsideTransition:
     ^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context)
    {
        //Délégué de gestion de la transition
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        
        if(orientation == UIInterfaceOrientationPortrait)
        {
            NSLog(@"PORTRAIT");
        }
        else{
            NSLog(@"PAYSAGE");
        }
        //executé quand la transition est terminée
    } completion:
     ^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context)
    {
        NSLog(@"La transition est terminée");
    }];
    //il faut toujorus appeller la classe super
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

//Si on veut interdire la rotation
/*-(UIInterfaceOrientationMask) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
