//
//  ViewController.m
//  03_PListe(listes de propriétés)
//
//  Created by etudiant on 4/19/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *etqNom;
@property (weak, nonatomic) IBOutlet UILabel *etqPrenom;
@property (weak, nonatomic) IBOutlet UILabel *etqDateNaissance;
@property (weak, nonatomic) IBOutlet UITextField *txtNbEnfants;

@property (weak, nonatomic) IBOutlet UITextField *txtSalaire;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //récupérer le chemin d'accès au fichioer
    //donneesPersonnelles.plis qui se trouive dans le bundle
    //j'utilise l'enchainement de méthode suicant
    //je recupère le bundle
    //je demande au bundle de me fournir le chemin
    //d'acc!s vers une ressources ayant un certain nom et tun certain type
    NSString* chemin = [[NSBundle mainBundle] pathForResource:@"DonneesPersonnelles" ofType:@"plist"];
    NSLog(@"%@",chemin);
    
    NSMutableDictionary* dicDonneesPersonnelles = [[NSMutableDictionary alloc]initWithContentsOfFile:chemin];
    
    NSLog(@"%@",[dicDonneesPersonnelles debugDescription]);
    
    self.etqNom.text = [dicDonneesPersonnelles objectForKey:@"nom"];
    self.etqPrenom.text = [dicDonneesPersonnelles objectForKey:@"prenom"];
    self.etqDateNaissance.text = [[dicDonneesPersonnelles objectForKey:@"Date naissance"] description];
    
     self.txtNbEnfants.text = [[dicDonneesPersonnelles objectForKey:@"nombre enfants"] description];
    
    self.txtSalaire.text = [[dicDonneesPersonnelles objectForKey:@"salaire"] description];
    //un fichier plist qui se trouve dans le bundle ne peut pas être modifier.
    
    //si on veut modifier des propriétés récupérées à partir de ce
    //fichier ou en définir d'autre et si on veut les sauvegarder
    //il faut créer une autre fichier plist
    //Ce fichier doit être créer dans l'espace dédié à l'application
    // ou fans un de ses sous-répertoires
    //d'habitude on utilise le sous répertoire document
}


- (IBAction)btnSauvegarderTouché:(id)sender {
    
    //récupérer la saisie
    NSString* telephone = self.txtSalaire.text;
    
    NSString* salaireTxt = self.txtSalaire.text;
    
    NSNumber* salaire;
    if(salaireTxt.length >0)
    {
        salaire = [NSDecimalNumber decimalNumberWithString:salaireTxt];
        if([salaire isEqualToNumber:[NSDecimalNumber notANumber]])
            {
                [self afficherAlerteAvecTitre:@"Erreur saisie" etMessage:@"Le salaire n'est pas correct"];
                return;
            }
    }
    //si on arrive ici mais est-ce que la salaire est accéptable?
    double sal = [salaire doubleValue];
    if(sal <0 || sal > 20000)
    {
        [self afficherAlerteAvecTitre:@"Erreur saisie"
                            etMessage:@"La valeur du salaire est erronée"];
        return;
    }
    
    NSString* nbEnfantsTxt = self.txtNbEnfants.text;
    NSNumber* nbEnfants;
    nbEnfants = [NSDecimalNumber decimalNumberWithString:nbEnfantsTxt];
    if(nbEnfantsTxt.length > 0)
    {
        if([nbEnfants isEqualToNumber:[NSDecimalNumber notANumber]])
        {
            [self afficherAlerteAvecTitre:@"Erreur de saisi"
                            etMessage:@"Le nombre d'enfants est erroné"];
            return;
        }
        int nb = [nbEnfants intValue];
        if(nb < 0 || nb >12)
        {
            [self afficherAlerteAvecTitre:@"Error saisie"
                            etMessage:@"Le nombre d'enfants doit être entre 0 et 12"];
            return;
        }
    }
    //créer un dictionaire modifiable contennat
    //les valeurs saisies
    NSMutableDictionary * dico = [[NSMutableDictionary alloc] init];
    
    //inserer les valeurs saisies
    [dico setObject:nbEnfants forKey:@"nombre enfants"];
    [dico setObject:salaire forKey:@"salaire"];
    [dico setObject:telephone forKey:@"telephone"];
    
    //je veux sauvegarder ce dictionaire dans un fichier .plish
    //je ne peux pas le faire dans donnéesPersonnelles.plish
    //car ce fichier appartient au bundle et n'est pas modifiable
    //je dois donc créer un nouveau fichier plist
    //où?
    //dans l'espace disque de l'application ou dans un de ses sous-répertoires(comme document
    //récuperer le nom du répertoire où on déposera
    //noter fichier
    
    NSSearchPathForDirectoriesInDomains(<#NSSearchPathDirectory directory#>, <#NSSearchPathDomainMask domainMask#>, <#BOOL expandTilde#>)
}
-(void)afficherAlerteAvecTitre:(NSString*)titre etMessage:(NSString*)message
{
    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle:titre
                                message:message
                                preferredStyle:UIAlertControllerStyleAlert];
    //définir un bouton pour fermer l'alerte
    UIAlertAction* actionFermeture = [UIAlertAction
                                      actionWithTitle:@"fermer"
                                      style:UIAlertActionStyleCancel
                                      handler:nil];
    
    //afficher le bouton à l'alerte
    [alert addAction:actionFermeture];
    //afficher l'alerte
    [self presentViewController:alert
        animated:YES
                     completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
