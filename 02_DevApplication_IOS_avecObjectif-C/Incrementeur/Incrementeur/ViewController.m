//
//  ViewController.m
//  Incrementeur
//
//  Created by etudiant on 27/04/2017.
//  Copyright © 2017 -. All rights reserved.
//
#import "ViewController.h"
#import "Utils.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *loginTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;
@property (strong, nonatomic) IBOutlet UIView *btnSignUp;
@property (nonatomic,strong) NSString* fichierDB;

@end

@implementation ViewController
static sqlite3* db;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginTxt.placeholder=@"login";
    self.passwordTxt.placeholder=@"password";
    NSArray* tbChemins = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory                                                             ,NSUserDomainMask,YES);
    
    self.fichierDB = [tbChemins[0] stringByAppendingPathComponent:@"UsersDb2.db"];
    
}
-(IBAction)testUser:(id)sender {
    if([self.loginTxt.text length]>0 && [self.passwordTxt.text length]>0)
    {
        const char * nomFile;
        nomFile = [self.fichierDB UTF8String];
        
        int ret = sqlite3_open(nomFile, &db);
        
        if(ret != SQLITE_OK)
        {
            NSLog(@"Echec ouverture base de données");
            return;
        }
        
        NSString* sql=[NSString stringWithFormat:@"select * from User WHERE User.login='%@'", self.loginTxt.text];
        
        
        NSLog(@"requete select : %@",sql);
        sqlite3_stmt* stmt;
        //preparer le statement
        ret = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, NULL);
        
        if(ret!= SQLITE_OK)
        {
            NSLog(@"ViewController: Echec préparation statement select");
            
            sqlite3_close(db);
            return;
        }
        
        int nbColonnes = sqlite3_column_count(stmt);
        NSString* pass;
        NSString* salt;
        while(sqlite3_step(stmt) == SQLITE_ROW)
        {
            //le contenu reférencé n'est pas modifiable
            const char* password=sqlite3_column_text(stmt,2);
            const char* salty=sqlite3_column_text(stmt,3);
            //créer une chaine Objectif-C
            pass = [[NSString alloc] initWithUTF8String:password];
            salt = [[NSString alloc] initWithUTF8String:salty];
            
            
        }
        if(!pass)
        {
               [Utils afficherAlerteAvecTitre:@"message" etMessage:@"Utilisateur inconnu" etParent:self];
           
        }
        else{
            if([pass isEqualToString:[Utils hashString:self.passwordTxt.text withSalt:salt]])
            {
              
                self.loginTxt.text=@"";
                self.passwordTxt.text=@"";
                [self performSegueWithIdentifier:@"connectHome" sender:sender];  //[Utils afficherAlerteAvecTitre:@"message" etMessage:@"Mot de passe correct" etParent:self];
            }else{
           
                  [Utils afficherAlerteAvecTitre:@"message" etMessage:@"Mot de passe incorrect" etParent:self];
            }
            
            
        }
    }
    else
        [Utils afficherAlerteAvecTitre:@"message" etMessage:@"Entrez un login et un mot de password" etParent:self];
 
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepare for segue");
    UIViewController* destination = segue.destinationViewController;
    if([destination isMemberOfClass:[HomeViewController class]])
    {
        NSLog(@"login:%@ \n password:%@",self.loginTxt.text,self.passwordTxt.text);
        
        ((HomeViewController*)destination).textRecu = self.loginTxt.text;
        
               }
    }
    
    
    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }
    
    
    @end
