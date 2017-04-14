//
//  ViewController.m
//  10_Dictionaires
//
//  Created by etudiant on 4/14/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary* couleurRGB = @{
                                 @"rouge":@"ff0000",
                                 @"vert":@"00ff00",
                                 @"bleu":@"0000ff",
                                 @"magenta":@"ff00ff",
                                 @"blanc":@"ffffff"
                                 };
    NSMutableDictionary* personnes = @{
                                       @"pierre":@20,
                                       @"marie":[NSNumber numberWithInt:20],
                                       @"Louise":@"dupont",
                                       @"philippe":@25
                                       }.mutableCopy;
    
    personnes = [@{
                  @"pierre":@20,
                  @"marie":[NSNumber numberWithInt:20],
                  @"Louise":@"dupont",
                  @"philippe":@25
                  } mutableCopy];
    
    NSLog(@"%@",[personnes debugDescription]);
    
    
    //création d'un dictionnaire en utilisant la literal syntax
    personnes = [NSMutableDictionary dictionaryWithDictionary:@{
                                                    @"pierre":@20,
                                                    @"marie":[NSNumber numberWithInt:20],
                                                    @"Louise":@"dupont",
                                                    @"philippe":@25
                                                    }];
    
    //on peut aussi créer un NSMutableDictioary vide et inserer les binômes
    //par après
    personnes = [[NSMutableDictionary alloc]init];
    [personnes setObject:[NSNumber numberWithInt:20] forKey:@"pierre"];
     [personnes setObject:@20 forKey:@"marie"];
     [personnes setObject:@"dupont" forKey:@"louise"];
    
    //si on dépose à la même clé un autre objet
    [personnes setObject:@40 forKey:@"marie"];
    NSLog(@"%@",[personnes debugDescription]);
    
    //récupérer une valeur attachée à une clé
    int age = [[personnes objectForKey:@"marie"]intValue];
    
    //Si la clé est une chaine de caractères, on peut aussi utiliser
    //la méthode valueForKey
    age = [[personnes valueForKey:@"marie"] intValue];
    
    NSLog(@"l'age de marie: %i", age);
    
    //extraire toutes les clés
    NSArray* tbClés = [personnes allKeys];
    NSLog(@"Le dictionaire 'personne' contient %lu clés:",
          (unsigned long)tbClés.count);
    for(NSString* cle in tbClés)
    {
        NSLog(@"%@", cle);
    }
    
    //récuper toutes les valeurs attachées à toutes les clés:
    NSLog(@"Le dictionnaire personne contient les valeurs suivantes");
    NSArray* tbValeurs  = [personnes allValues];
    NSLog(@"Le dictionaire 'personne' contient %lu clés:",
          (unsigned long)tbValeurs.count);
for(NSString* valeur in tbValeurs)
{
    NSLog(@"%@", valeur);
}
    
    //si je veux ajouter 3 ans à l'âge de chaque personne
   for(NSString * valeur in tbValeurs)
    {
        //tester le type de la valeur courante
        if([valeur isKindOfClass:[NSString class]])
            NSLog(@"Valeur chaine:%@",(NSString*) valeur);
        else
            NSLog(@"valeur numérique:%i",[(NSNumber*)valeur intValue]+3);
    }
    
    //créer et itiliser une méthode afficherContenuDictionaire, avec un argument
    //contenant le dictionnaire à afficher
    NSLog(@"Test de l'affichage avec une méthode");
    [self afficherContenuDictionaire:personnes];
    
    
}
-(void)afficherContenuDictionaire:(NSDictionary *)dico
{
    NSArray* tbKeys =[dico allKeys];

    for(NSString* key in tbKeys)
    {
        NSLog(@"clé %@: valeur %@ ", key,[dico objectForKey:key]);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
