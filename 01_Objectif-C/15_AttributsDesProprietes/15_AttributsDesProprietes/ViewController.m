//
//  ViewController.m
//  15_AttributsDesProprietes
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Societe.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Societe * s = [[Societe alloc] init];
    
  
    
    [s EcrireNom:@"Ma société"]; //on a changé le nom du setter
    
    NSLog(@"Le nom de la société: %@",[s lireNom]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
