//
//  TrajetViewController.m
//  09_MapView
//
//  Created by etudiant on 24/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "TrajetViewController.h"
#import <MapKit/MapKit.h>
@interface TrajetViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *maMap;

@end

@implementation TrajetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)retourEcranPrecedentTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)bouttonRetourPremierEcranTouched:(id)sender {
}

- (IBAction)btnRecarculer:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
