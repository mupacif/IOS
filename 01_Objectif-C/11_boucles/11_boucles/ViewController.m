//
//  ViewController.m
//  11_boucles
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

    NSArray* voitures = @[@"Aston Martin DB10",
                          @"Bougatti Veyron",
                          @"Hennessey Venom"];
    
    NSLog(@"Mes voitures de colléctions");
    for(int i=0; i <voitures.count ; i++)
    {
        NSString * voiture = [voitures objectAtIndex:i];
        NSLog(@"%@", voiture);
    }
    NSLog(@"Mes voitures affichées avec un for étendu:");
    for(NSString*voiture in voitures)
    {
        NSLog(@"%@", voiture);
    }
    
    NSLog(@"Mes voitures affichées avec une boucle while");
    //usage d'un itérateur (interface collection d'objects qui dispose
    //d'une méthode next
    //une fois à la fin l'itérateur est épuisée
    //il faut recréer un nouveau
    NSEnumerator* enumérateur =  [voitures objectEnumerator];
    id element;
    while((element = enumérateur.nextObject) != nil )
    {
        NSLog(@"%@", element);
    }
    
    NSLog(@"Mes voitures affichées avec une boucles do-while");
    enumérateur = [voitures objectEnumerator];
    element = [enumérateur nextObject];
    do
    {
        NSLog(@"%@",element);
    }while((element = enumérateur.nextObject) != nil);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
