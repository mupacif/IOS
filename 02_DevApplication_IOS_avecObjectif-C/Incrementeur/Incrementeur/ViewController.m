//
//  ViewController.m
//  Incrementeur
//
//  Created by etudiant on 27/04/2017.
//  Copyright © 2017 -. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"
#import <sqlite3.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *loginTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;
@property (strong, nonatomic) IBOutlet UIView *btnSignUp;
@property (nonatomic,strong) NSString* fichierDB;

@end
sqlite3* db;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginTxt.placeholder=@"login";
    self.passwordTxt.placeholder=@"password";
    NSArray* tbChemins = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory                                                             ,NSUserDomainMask,YES);
    
    self.fichierDB = [tbChemins[0] stringByAppendingPathComponent:@"UsersDb.db"];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController* destination = segue.destinationViewController;
    if([destination isMemberOfClass:[HomeViewController class]])
    {
        NSLog(@"login:%@ \n password:%@",self.loginTxt.text,self.passwordTxt.text);
        
        ((HomeViewController*)destination).textRecu = self.loginTxt.text;
        
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
            
            NSString* sql=[NSString stringWithFormat:@"select password from User "
                 "where User.login = %@ ", self.loginTxt.text];
            
            
            
            sqlite3_stmt* stmt;
            //preparer le statement
            ret = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, NULL);

            if(ret!= SQLITE_OK)
            {
                NSLog(@"Echec préparation statement select");
                
                sqlite3_close(db);
                return;
            }
            
            
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
