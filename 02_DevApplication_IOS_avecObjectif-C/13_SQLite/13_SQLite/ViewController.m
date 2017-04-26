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
@property (weak, nonatomic) IBOutlet UIButton *btnLireEmplsApple;
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
    //recuper en tant que chane c
    fichierDB_chaineC= [self.fichierDB UTF8String];
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
    //créer la réquete d'insertion
    NSString* sql = [NSString stringWithFormat:@"insert into Societes (Societe) "
                     "select 'Apple'"
                     "union "
                     "select 'Oracle'"
                     "union "
                     "select 'Microsoft'"
                     ];
    
    [self ajouterTexteAffichage:@"\nRequete insertion:"];
    [self ajouterTexteAffichage:sql];
    //déclarer une variable qui contiendra un statement ("une enveloppe
    //de mon ordre sql")
    // Créer un statement
    sqlite3_stmt* stmt;
    //preparer le statement
    sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, NULL);
    //tester si la preparation du statement a reussi
    if(ret!= SQLITE_OK)
    {
        [self ajouterTexteAffichage:@"Echec préparation statement insertion société"];
        
        sqlite3_close(db);
        return;
    }
    
    //éxecuter le statement
    ret = sqlite3_step(stmt);
    if(ret == SQLITE_DONE)
        [self ajouterTexteAffichage:@"\nLa requête d'insertion société a bien été exécutée"];
    else
    {
      [self ajouterTexteAffichage:@"\nEchec insertion société.\n Erreur signalée:"];
      [self ajouterTexteAffichage:[NSString
                                   stringWithCString:sqlite3_errmsg(db)
                                   encoding:NSUTF8StringEncoding]];
    }
    
    //je supprime le statement (pour libérer ses ressources)
    sqlite3_finalize(stmt);




    
    sql = [NSString stringWithFormat:@"insert into Employes (Nom, Prenom, DateEmbauche, Salaire, IdSociete) "
           "select 'Jobs', 'Steve', '2008-04-26', 1250, 1 " // où 1 est l'indentifiant de la société Apple
           "union "
           "select 'Martin', 'Julie', '%@', 2000,(select IdSociete from Societes where Societe='Apple') "//sous-requête
           "union "
           "select 'Durand', 'Pierre', '1998-11-22', 3123, 3", [[NSDate date] description] // date d'aujourd'hui
           ];
    
    [self ajouterTexteAffichage:@"\n Requête insertion employés"];
    [self ajouterTexteAffichage:sql];
    
    ret = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, NULL);
    //tester si la preparation du statement a reussi
    if(ret!= SQLITE_OK)
    {
        [self ajouterTexteAffichage:@"Echec préparation statement insertion employés 2"];
        
        sqlite3_close(db);
        return;
    }
    
    //éxecuter le statement
    ret = sqlite3_step(stmt);
    
    if(ret == SQLITE_DONE)
        [self ajouterTexteAffichage:@"\nLa requête d'insertion des employés a bien été exécutée"];
    else
    {
        [self ajouterTexteAffichage:@"\nEchec insertion Employés.\n Erreur signalée:"];
        [self ajouterTexteAffichage:[NSString
                                     stringWithCString:sqlite3_errmsg(db)
                                     encoding:NSUTF8StringEncoding]];
    }
    
    //je supprime le statement (pour libérer ses ressources)
    sqlite3_finalize(stmt);
    sqlite3_close(db); // pour dévérouiller les tables

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
    //recuper en tant que chane c
    fichierDB_chaineC= [self.fichierDB UTF8String];
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
    //création 1er table
    char* msgErreur;
    ret =sqlite3_exec(db,"create table if not exists Societes"
                      "("
                      "IdSociete integer primary key autoincrement,"
                      "Societe text not null unique"
                      ")",NULL, NULL, &msgErreur);
    
    if(ret != SQLITE_OK)
    {
        [self ajouterTexteAffichage:[NSString stringWithFormat:@"Echec création table Sociétés:                                  %s",msgErreur]];
        //je ferme la base
        sqlite3_close(db);
        //je sorts
        return;
    }
    [self ajouterTexteAffichage:@"Creation de la table Sociétés reussie"];
    
    //création 2e table
    ret =sqlite3_exec(db,"create table if not exists Employes"
                      "("
                      "IdEmploye integer primary key autoincrement,"
                      "Nom text not null,"
                      "Prenom text not null,"
                      "DateEmbauche date not null,"
                      "Salaire float not null CHECK(Salaire > 0),"
                      "IdSociete integer not null,"
                      "constraint NomPrenomUnique unique(Nom,Prenom),"
                      "foreign key (IdSociete) references Societes(IdSociete) ON DELETE CASCADE"
                      ")",NULL, NULL, &msgErreur);
    
    if(ret != SQLITE_OK)
    {
        [self ajouterTexteAffichage:[NSString stringWithFormat:@"Echec création table Employes:                                  %s",msgErreur]];
        //je ferme la base
        sqlite3_close(db);
        //je sorts
        return;
    }
    
    
    sqlite3_close(db);
    [self ajouterTexteAffichage:@"Creation de la table Employes reussie"];
}
-(void) ajouterTexteAffichage:(NSString*) text_a_ajouter
{
    self.txtAffichage.text = [self.txtAffichage.text stringByAppendingFormat:@"%@\n",text_a_ajouter];
    
}
- (IBAction)btnLireTouched:(id)sender {
    
    fichierDB_chaineC= [self.fichierDB UTF8String];
   
    int ret = sqlite3_open(fichierDB_chaineC, &db);

    if(ret != SQLITE_OK)
    {
        [self ajouterTexteAffichage:@"Echec creation base de données"];
        return;
    }
    NSString* sql;
    if(sender == self.btnLireEmplsApple)
        sql=@"";
    else
        sql=@"";
    
    return;
    
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
