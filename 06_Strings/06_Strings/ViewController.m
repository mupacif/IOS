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
    //NSString *formation2 = @"swift";
    NSString *formation2 = [NSString stringWithFormat:
                     @"swi",@"ft"];
    if(formation1==formation2)
        NSLog(@"Les adresses des variables f1 et f2 sont égales");
    else
        NSLog(@"Les adresses des variables f1 et f2 ne sont pas égales");
    
 
    
    
    //pour comparer le contenu des chaines, on utilise ==
    //mais des méthodes spécialisé
    formation2 =@"SWIFT";
    if([formation1 isEqualToString:formation2])
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
    if([formation1 caseInsensitiveCompare:formation2] == NSOrderedSame)
        NSLog(@" usage compare: f1:%@ == f2:%@",formation1,formation2);
    else
        NSLog(@"usage compare: f1:%@ != f2:%@",formation1,formation2);
    
    //Exercice 2
    // 1-etudier la façon dont on peut extraire une sous-chaine à partir d'une chaine en précisant les limites d'extractions
    
    NSString * name = @"Pacifique Mugwaneza";
    
    
    NSString * sub1 = [name substringWithRange:NSMakeRange(3, 3)];
    
    NSLog(@"subStringed:%@", sub1);
    // 2-donner un exemple d'utilisation de la longueur d'une chaine
    NSLog(@" size of sub1 : %lu",(unsigned long)[sub1 length]);
    // 3-étudier la façon dont on peut remplacer une sous-chaine par une autre sous-chaine
    
    // 4- trouver l'équivalent de la méthode d'instance java
    
    //indexOf et imaginer un algorithme pour trouver toutes les occurences d'une sous-chaines
    
    //les occurences d'une chaine

        
        
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
