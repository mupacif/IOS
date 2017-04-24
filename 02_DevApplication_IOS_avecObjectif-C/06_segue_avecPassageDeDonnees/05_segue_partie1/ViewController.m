//
//  ViewController.m
//  05_segue_partie1
//
//  Created by etudiant on 20/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerB.h"
#import "ViewControllerC.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtSaisie;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//overrider la méthode qui est executée juste avant la
//transition(juste avant le segue)
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    

//quel est lz destinataire de ce ségué?
//Dans notre cas, on peut aller vers l'écran 2 et
//vers l'écran

// récuper le controleur de desination

    UIViewController* destination = segue.destinationViewController;
    if([destination isMemberOfClass:[ViewControllerB class]])
    {
        ViewControllerB* dest = (ViewControllerB*)destination;
        dest.textRecu = self.txtSaisie.text;
    }
    else if([destination isMemberOfClass:[ViewControllerC class]])
    {
        ViewControllerC* dest = (ViewControllerC*)destination;
        dest.donneesRecu = self.txtSaisie.text;
    }
}
//Dans ViewController.m
//cette méthode a été liée à l'évenement 'unwind' qui transfer le contrôle
// de l'écran 3 vers l'écran de départ
//du segue( en occurence
//l'ecran 1

-(IBAction)retourAuPremierEcran:(UIStoryboardSegue*)segue
{
    NSLog(@"Execution de la méthode 'retourAuPremierEcran");
    //récuperer les données saisies dans l'écran 3
    //je peux;
    //solution 1
    //utiliser une exportée qui contient les données saisies

   ViewControllerC* ec3 =
    (ViewControllerC*)segue.sourceViewController;
    //self.txtSaisie.text = ec3.donneesRecu;
    
    
    //solution 3:
    //utiliser une méthode, exportée par l'écran 3
    //capable de fournir ces données
    self.txtSaisie.text = [ec3 recupererDonneesSaisies];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
