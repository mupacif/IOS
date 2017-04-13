//
//  ViewController.m
//  08_methodes
//
//  Created by etudiant on 4/13/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) double soldeCompteBancaire;
@property (nonatomic) double prixProduit;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.soldeCompteBancaire = 450.25;
    self.prixProduit = 460;
    
    NSLog(@"peut on acheter un produit ayant prix: %@",[self peutOnAcheterProduitAyantPrix:self.prixProduit]?@"oui":@"non");
    
    NSLog(@"peut on acheter un produit ayant prix avec la tva: %@",[self peutOnAcheterProduitAyantPrix:self.prixProduit etTauxTVA:0.21]?@"oui":@"non");
    
    NSLog(@"peut on acheter un produit ayant prix dans parametre nomé %@",[self peutOnAcheterProduitAyantPrix:self.prixProduit:0.21]?@"oui":@"non");
}

-(BOOL) peutOnAcheterProduitAyantPrix:(double)prix_a_payer {
    if(self.soldeCompteBancaire >= (prix_a_payer))
        return YES;
    else
        return NO;
    
    // return self.soldeCompteBancaire >= (1+pourcentage)*prix_a_payer;
    //le nom de cette fonction est peutOnAcheterProduitAyantPrix::
}
-(BOOL) peutOnAcheterProduitAyantPrix:(double)prix_a_payer
                            etTauxTVA:(double) pourcentage
{
    if(self.soldeCompteBancaire >= (1+pourcentage)*prix_a_payer)
        return YES;
    else
        return NO;
    
   // return self.soldeCompteBancaire >= (1+pourcentage)*prix_a_payer;
    //le nom de cette fonction est peutOnAcheterProduitAyantPrix::
}

-(BOOL) peutOnAcheterProduitAyantPrix:(double)prix_a_payer
                                     :(double) pourcentage
{
    if(self.soldeCompteBancaire >= (1+pourcentage)*prix_a_payer)
        return YES;
    else
        return NO;
    
    // return self.soldeCompteBancaire >= (1+pourcentage)*prix_a_payer;
    //le nom de cette fonction est peutOnAcheterProduitAyantPrix::
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
