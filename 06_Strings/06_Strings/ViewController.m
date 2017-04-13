//
//  ViewController.m
//  06_Strings
//
//  Created by etudiant on 4/13/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // créer un string
    NSString *prenom = @"Marie";
    //marie s'appelle string literal
    // literal chaine
    
    // NSLog(prenom); ne marche pas car prenom ne contient pas un string litteral
    NSLog(@"%@", prenom);
    
    //NSString est une classe
    //on peut donc utiliser l'enchaineùment alloc/init
    NSString *chaineVide = [[NSString alloc] init];
    //équivalent de
    // NSSTRING *chaineVide = @""
    NSLog(@"chaine vide:%@", chaineVide);
    
    //concaténation des chaines
    NSString* nomComplet = [NSString stringWithFormat:
                             @"%@ Durand", prenom];
    
    NSLog(@"nom complet: %@", nomComplet);
    
    //concaténation de 3 chaines
    nomComplet = [NSString stringWithFormat:
                            @"%@ Durand %@", prenom,@"Cécile"];
    
    NSLog(@"nom complet: %@", nomComplet);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
