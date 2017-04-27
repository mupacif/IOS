//
//  RegisterViewController.m
//  Incrementeur
//
//  Created by etudiant on 27/04/2017.
//  Copyright © 2017 -. All rights reserved.
//

#import "RegisterViewController.h"
#import "Utils.h"
#import <sqlite3.h>
@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *loginTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordConfirm;
@property (weak, nonatomic) IBOutlet UITextField *emailTxt;
@property (nonatomic,strong) NSString* fichierDB;
@end

sqlite3* db;
@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginTxt.placeholder = @"login";
    self.passwordTxt.placeholder = @"password";
    self.passwordConfirm.placeholder = @"password confirmation";
    self.emailTxt.placeholder = @"email";
    
    NSArray* tbChemins = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory                                                             ,NSUserDomainMask,YES);
  
    self.fichierDB = [tbChemins[0] stringByAppendingPathComponent:@"UsersDb.db"];
    

}
- (IBAction)retourEcranPrecedentTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)registerTouched:(UIButton *)sender {
    NSString* msg=@"";
    if([self.loginTxt.text length] < 3)
    {
        msg = [msg stringByAppendingString:@"Login doit être plus grand que 3 caractères"];
    }
    
    if([self.passwordTxt.text length] < 3)
    {
        msg =[msg stringByAppendingString:@"le mot de passe doit avoir plus de 3 caractères"];
    }
    
    if(![self.passwordTxt.text isEqualToString:self.passwordConfirm.text])
    {
        msg =[msg stringByAppendingString:@"les mots de passe ne correspondent pas "];
    }
    if([msg length] == 0)
    {
        self.registerUser;
    }else{
         [Utils afficherAlerteAvecTitre:@"Error" etMessage:msg etParent:self];
    }
}
//On crée un nouvelle utilisateur
-(void) registerUser
{
    //test si le fichier sqlite existe
    NSFileManager* fm = [NSFileManager defaultManager];
    
    if(![fm fileExistsAtPath:self.fichierDB])
    {
        self.creationTableUser;
        //[fm removeItemAtPath:self.fichierDB error:nil];
    }else{
        NSLog(@"UsersDatabase exists already");
        
        const char * nomFile;
        nomFile = [self.fichierDB UTF8String];
        
        int ret = sqlite3_open(nomFile, &db);
        if(ret != SQLITE_OK)
        {
            NSLog(@"impossible d'ouvrir le fichier contenant les users");
            return;
        }
        
        NSString* sql = [NSString stringWithFormat:@"insert into User (login,password,money) "
                         "select '%@','%@','%d'",self.loginTxt.text,
                         [Utils
                          hashString:self.passwordTxt.text withSalt:[Utils randomStringWithLength:32]]
                         ,
                         0];
        sqlite3_stmt* stmt;
        //preparer le statement
        sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, NULL);
        
        if(ret!= SQLITE_OK)
        {
            NSLog(@"échec à la création du statement");
            
            sqlite3_close(db);
            return;
        }
        ret = sqlite3_step(stmt);
        if(ret == SQLITE_DONE)
            NSLog(@"\nLa requête d'insertion User a bien été exécutée");
        else
        {
            NSLog(@"\nEchec insertion User.\n ce nom d'utilisateur existe déjà");
            [Utils afficherAlerteAvecTitre:@"Erreur" etMessage:@"\nEchec insertion User.\n ce nom d'utilisateur existe déjà" etParent:self];
            return;
        }
        
        //je supprime le statement (pour libérer ses ressources)
        sqlite3_finalize(stmt);
        sqlite3_close(db);
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}
-(void)creationTableUser
{
    const char * nomFile;
   
    nomFile = [self.fichierDB UTF8String];
    
    int ret = sqlite3_open(nomFile, &db);
    if(ret != SQLITE_OK)
    {
        NSLog(@"Echec création/ouverture db");
        return;
    }
    //création de la table user
    ret =sqlite3_exec(db,"create table if not exists User"
                      "("
                      "idUser integer primary key autoincrement,"
                      "login text not null unique,"
                      "password text not null,"
                      "money integer not null"
                      ")",NULL, NULL, NULL);
    if(ret != SQLITE_OK)
    {
        NSLog(@"Echec création table User");
        //je ferme la base
        sqlite3_close(db);
        //je sorts
        return;
    }
    sqlite3_close(db);
    NSLog(@"Creation de la table empoye reussi");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
