//
//  ViewController.m
//  05_GettersEtSetters
//
//  Created by etudiant on 4/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Automobile.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // instanciation
    Automobile * automobile = [Automobile new];
    
    //appel implicite du setter
    automobile.odometre = 10000;
     //appel implicite du getter
    NSLog(@"le kilométrage de votre voiture : %li",automobile.odometre);
    
    automobile.odometre = 5000;
    NSLog(@"le kilométrage de votre voiture : %li",automobile.odometre);
   
    //utilisation explicite
    [automobile setOdometre:12000];
    NSLog(@"le kilométrage de votre voiture : %li",[automobile odometre]);
    
    
    automobile.modele = @"aston martin db10";
    NSLog(@"votre voiture : %@",automobile.modele);
    
    automobile.modele = @"renault";
    NSLog(@"votre voiture : %@",automobile.modele);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
