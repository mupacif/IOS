//
//  TrajetViewController.h
//  09_MapView
//
//  Created by etudiant on 24/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface TrajetViewController : UIViewController <MKMapViewDelegate>
//point qui recevra le information de position
// l'endroit où l'on copnsidère se rendre
@property (nonatomic,strong) MKMapItem* destinationTrajet;
@end
