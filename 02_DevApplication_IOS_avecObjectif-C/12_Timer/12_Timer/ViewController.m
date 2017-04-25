//
//  ViewController.m
//  12_Timer
//
//  Created by etudiant on 25/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *etqAffichage;
@property (nonatomic) int compteur;
@property (nonatomic,weak) NSTimer* horloge;
@property (nonatomic,strong) UIColor* colorStop;
@property (nonatomic,strong) UIColor* colorStart;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.horloge = [NSTimer scheduledTimerWithTimeInterval:1 target:self
                                                  selector:@selector(onTopHorloge)
                                                  userInfo:nil                                                  repeats:YES];
    
    self.colorStart = [UIColor greenColor];
}
-(void)onTopHorloge
{
    
    //self.compteur++;
    // self.etqAffichage.text = self.compteur;
    self.etqAffichage.text = [NSString stringWithFormat:@"%i",self.compteur++];
    
}
- (IBAction)btnStartTouched:(UIButton *)sender {
    //pour arrêter un NStimer est en etat de sconstruciton
    
    if(self.horloge.isValid)
    {
        [self.horloge invalidate];
        //sauvegarde la couleur du stop
        self.colorStop = [sender titleColorForState:UIControlStateNormal];
        [sender setTitle:@"Start" forState:UIControlStateNormal];
           [sender setTitleColor:self.colorStart forState:UIControlStateNormal];
    }else
    {
        //une fois invalidé, une horloge ne ^peut plus être
        //revalidé
        //il faut en créer une autre
        self.horloge = [NSTimer scheduledTimerWithTimeInterval:1 target:self
                                                      selector:@selector(onTopHorloge)
                                                      userInfo:nil                                                  repeats:YES];
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
