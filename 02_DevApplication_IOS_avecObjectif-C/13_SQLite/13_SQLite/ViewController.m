//
//  ViewController.m
//  13_SQLite
//
//  Created by etudiant on 25/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *txtAffichage;
//propriété qui contiendra le répéertoire Document
//de l'application
@property (nonatomic, strong)NSString* repDocuments;
//le nom du fichier contenant la base de données
@property (nonatomic,strong) NSString* fichierDB;
@end

@implementation ViewController
//déclarer une variable de type language C qui
// représentera la base de données au niveau de
//mon application
sqlite3* db;

//Définir une constance type langage C qui contiendra
//le nom du fichier de la base
const char* fichierDB_chaineC;

- (void)viewDidLoad {
    [super viewDidLoad];
    _txtAffichage.layer.borderWidth = 2.0;
    _txtAffichage.layer.borderColor = [[UIColor grayColor] CGColor];
    self.txtAffichage.text=@"";
    //récupérer le nom complet du répertoire Document
    NSArray* tbChemins = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory //je précide ce que je cherche(en occurence le répertoire docuement)
    ,NSUserDomainMask,YES);
    
    self.repDocuments = tbChemins[0];
    
    //créer le nom du fichier contenant la base
    //de données
    self.fichierDB = [self.repDocuments stringByAppendingPathComponent:@"maBase.db"];
    
    //récupérer le nom de la base eb tant que chaine c
    fichierDB_chaineC= [self.fichierDB UTF8String];
}
- (IBAction)btnEcrireTouched:(id)sender {
}

- (IBAction)btnCreatebaseTouched:(id)sender {
    //Je dois vérifier si le fichier contenant la base
    //existe déjà
    //dans ce cas, je dois dabord le supprimer
    //pour verifier si le fichier existe, j'ai besoin
    //d'une gestionnaire de fichier
    NSFileManager* fm = [NSFileManager defaultManager];
    //tester si le fichier maBase.db existe
    if([fm fileExistsAtPath:self.fichierDB])
    {
        //supprimer l'ancien fichier
        [fm removeItemAtPath:self.fichierDB error:nil];
    }
    //créer/ouvrir la base
    int ret = sqlite3_open(fichierDB_chaineC, &db);
    //la fonction sqlite3_open ouvre la base si
    //elle existe et la créer sinon
    //tester si la base a été crée
    if(ret != SQLITE_OK)
    {
        [self ajouterTexteAffichage:@"Echec creation base de données"];
        return;
    }
    [self ajouterTexteAffichage:@"Creation de la base de données reussie"];

    
}
-(void) ajouterTexteAffichage:(NSString*) text_a_ajouter
{
    self.txtAffichage.text = [self.txtAffichage.text stringByAppendingFormat:@"%@\n",text_a_ajouter];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
