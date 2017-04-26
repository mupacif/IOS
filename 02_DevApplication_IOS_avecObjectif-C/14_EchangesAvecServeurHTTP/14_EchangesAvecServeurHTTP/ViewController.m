//
//  ViewController.m
//  14_EchangesAvecServeurHTTP
//
//  Created by etudiant on 26/04/2017.
//  Copyright © 2017 -. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {	
    [super viewDidLoad];
   //étape 1
    //je veux charger le contenu d'une page web
    //en utilisant une sessions asynchrine(le chargement aura lieu en background)
    NSURLSession * session = [NSURLSession sharedSession];
    NSURL* url = [NSURL URLWithString:@"http://www.greceanu.com/default.html"];
    
    // définir la tache à executer par la session
    NSURLSessionDataTask* tache = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable donneesChargees, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Données chargé");
        NSLog(@"%@",[NSString stringWithUTF8String:[donneesChargees bytes]]);
        //NSLog(@"%@",[NSString stringWithUTF8String:donneesChargees); En Binaire
    }];
    //executer la tache
    [tache resume];
    NSLog(@"La tache a été lancée");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
