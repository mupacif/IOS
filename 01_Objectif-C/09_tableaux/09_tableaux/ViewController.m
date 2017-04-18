//
//  ViewController.m
//  09_tableaux
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
    NSArray * tb = [[NSArray alloc] init];
    NSLog(@"%@", tb.debugDescription);
    
    tb = [NSArray arrayWithObjects:@"élément 0",@"élément 1",@"élément 2",nil];
    NSLog(@"%@", tb.debugDescription);
    [self afficherContenuTableau:tb];
    
    NSMutableArray * tbm = [[NSMutableArray alloc] init];
    
    [tbm addObject:@"e0"];
    [tbm addObject:@"e1"];
    [tbm addObject:@"e2"];
    [tbm addObject:@"e3"];
    [tbm addObject:@"e4"];
    NSLog(@"Le contenu de tbm:");
    [self afficherContenuTableau:tbm];
    
    //insertion d'un élément à une position donnée
    [tbm insertObject:@"e1x" atIndex:1];
    NSLog(@"Le contenu de tbm après insertion de e1x");
    [self afficherContenuTableau:tbm];
    
    //modification d'un élément de trouvant à l'index 1
    [tbm replaceObjectAtIndex:1 withObject:@"e111"];
    NSLog(@"Le contenu de tbm après le remplacement à la position 1");
    [self afficherContenuTableau:tbm];
    
    //supprimer l'élément se trouvant à l'index 1
    [tbm removeObjectAtIndex:1];
    NSLog(@"Le contenu de tbm après la suppréssion de position 1");
    [self afficherContenuTableau:tbm];
    
    //supprimer un objet en supprimant son object
    [tbm removeObject:@"e0"];
    NSLog(@"Le contenu de tbm après la suppréssion d'un object nommé");
    [self afficherContenuTableau:tbm];
    
    //un tableau NSMutableArray peut être crée avec un ensemble de valeurs
    tbm = [NSMutableArray arrayWithObjects:@"a0",@"a1",@"a2",@"a3",nil];
    NSLog(@"Le contenu de tbm après l'ajout de plusieurs valeurs");
    [self afficherContenuTableau:tbm];
    
    //raccourci
    tbm = (NSMutableArray *)@[@"a0",@"a1",@"a2",@"a3"];
    
    tbm = [NSMutableArray arrayWithArray:@[@"a0",@"a1",@"a2",@"a3"]];
    
    tbm = [@[@"a0",@"a1",@"a2",@"a3"] mutableCopy];
    tbm = @[@"a0",@"a1",@"a2",@"a3"].mutableCopy;
    
    
}

-(void) afficherContenuTableau:(NSArray *)tb
{
    if(tb.count ==0)
        NSLog(@"Le tableau est vide");
    else{
        NSLog(@"Le tableau contient %lu éléments",(unsigned long)tb.count);
    }
    
    for(int i =0;i< tb.count;i++)
        NSLog(@"tb[%i]=%@",i,[tb objectAtIndex:i]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
