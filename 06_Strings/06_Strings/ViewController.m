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
    
    //2e posibilités
    //Crée à partir de ce qui existe déjà
    NSString *chaineResultat = [nomComplet stringByAppendingString:@"- employé chez Apple"];
    
    NSLog(@"Employé et société:%@", chaineResultat);
    
    
    /*
     Comparaison de 2 chaines
     */
    NSString *formation1 = @"Swift";
    NSString *formation2 = @"swift";
    //NSString *formation2 = [NSString stringWithFormat:
     //                   @"swi",@"ft"];
    if(formation1==formation2)
        NSLog(@"Les variables f1 et f2 sont égales");
    else
        NSLog(@"Les variables f1 et f2 ne sont pas égales");
    
 
    
    
    //pour comparer le contenu des chaines, on utilise ==
    //mais des méthodes spécialisé
    formation2 =@"swift";
    if([formation2 isEqualToString:formation2])
        NSLog(@"f1:%@ == f2:%@",formation1,formation2);
    else
        NSLog(@"f1:%@ != f2:%@",formation1,formation2);
    
    //si on veut rendre la comparaison non case sensitive
    //on a 2 solutions
    // mettre en oeuvere les 2 solutions
    //- utiliser le passage en minuscule
    
    if([ [formation1 lowercaseString] isEqualToString: [formation2 lowercaseString]])
        NSLog(@" usage lowercaseString: f1:%@ == f2:%@",formation1,formation2);
    else
        NSLog(@"usage lowercaseString: f1:%@ != f2:%@",formation1,formation2);
    
    
       //-utiliser un fonction spécialisé
    if([formation1 compare:formation2])
        NSLog(@" usage compare: f1:%@ == f2:%@",formation1,formation2);
    else
        NSLog(@"usage compare: f1:%@ != f2:%@",formation1,formation2);

        
        
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
