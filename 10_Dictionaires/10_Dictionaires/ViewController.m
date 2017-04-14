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
                                       @"Louis":@"dupont",
                                       @"philippe":@25
                                       }.mutableCopy;
    
    personnes = [@{
                  @"pierre":@20,
                  @"marie":[NSNumber numberWithInt:20],
                  @"Louis":@"dupont",
                  @"philippe":@25
                  } mutableCopy];
    NSLog(@"%@",[personnes debugDescription]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
