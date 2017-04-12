//
//  ViewController.m
//  04_propriétés_vs_variable_instance
//
//  Created by etudiant on 4/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Personne.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Personne * personne1 = [[Personne alloc] init];
    [personne1 setPrenom:@"Jean Clause"];
    personne1.nom = @"Van Damme";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
