//
//  ViewController.m
//  07_Numbers
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
    int i=10;
    float f=13.1231456789;
    double fd=13.1231456789;
    NSLog(@"int: %d, float:%.10f,double:%,20f",i,f,fd);
    
    //je ne peux pas créer un tableau pour
    //stoquer des variables types valeurs
    //NSArray * tb = @[i,f,fd ];
    
    //obligé de tranformer les valeurs primitives en objets
    NSNumber * objInt = [NSNumber numberWithInt:i];
    NSNumber * objFloat = [NSNumber numberWithFloat:f];
    NSNumber * objDouble = [NSNumber numberWithDouble:fd];
    
    NSArray * tb = @[objInt,objFloat,objDouble];
    
    //EXTRACTION
    //Pour récuper les valeurs déposées dans un object
    //de type NSNumber on utilise des méthodes comme
    int vi = objInt.intValue;
    
    float vf = objFloat.floatValue;
    double vfd = objDouble.doubleValue;
    
    NSString *chaineFd = [objDouble stringValue];
    
    //Raccourcis pour créer des objects de type NSNumber
    
    NSNumber * monBool = @YES;
    NSNumber * monFloat = @(f);
    NSNumber * monEntrier = @13;
    
    NSLog(@"mon float %@",monFloat);
    //méthode de fabrique
    NSNumber * resultat = [NSNumber numberWithFloat:vi*vf];
    
    NSNumber * r = @(13/3);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
