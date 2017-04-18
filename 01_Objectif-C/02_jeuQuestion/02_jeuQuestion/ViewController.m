//
//  ViewController.m
//  02_jeuQuestion
//
//  Created by etudiant on 4/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
 {
     NSDictionary * dictionnaitreQuestions;
     
     NSArray * tbQuestions;
     }
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dictionnaitreQuestions = @{
                               @"Etes en stage?":@"oui",
                               @"Aimez vous objectif-c?":@"oui",
                               @"Etudier language swift?":@"oui",
                               @"stage java?":@"non",
                               @"Objectif c vous semble difficile":@"non",
                               @"swift est un language objectif-c like?":@"non"
                               };
    // extraire des questions et les déposer dans un tableau
    tbQuestions = [dictionnaitreQuestions allKeys];
}

- (IBAction)poserUnQuestion:(UIButton *)sender {
    //choix d'une question au hasard
    int index = arc4random()%[tbQuestions count];
    // récupération de la question à afficher
    NSString * question = [tbQuestions objectAtIndex:index];
    //récupération de la réponse attendue
    NSString * reponseAttendue = [dictionnaitreQuestions objectForKey:question];
    
    // l'alert
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Question"
                                 message:question
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    //la réponse oui
    
    UIAlertAction* actionBtnOui = [UIAlertAction
                                   actionWithTitle:@"oui"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction* action){
                                   //bloc executé juste après
                                       //verification de l'alerte et verification
                                       //la réponse
                                       [self verifierReponseDonnée:@"oui" avecReponseCorrect:reponseAttendue];
                                   }];
    
    //la réponse non
    
    UIAlertAction* actionBtnNon = [UIAlertAction
                                   actionWithTitle:@"non"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction* action){
                                       //bloc executé juste après
                                       //verification de l'alerte et verification
                                       //la réponse
                                       [self verifierReponseDonnée:@"non" avecReponseCorrect:reponseAttendue];
                                   }];
    
    [alert addAction:actionBtnOui];
    [alert addAction:actionBtnNon];
    
    [self presentViewController:alert animated:YES completion:nil];
    

}

-(void) verifierReponseDonnée:(NSString *) reponseDonnee avecReponseCorrect:(NSString*) reponseCorrecte{
    
    NSString *message;
    
    if([reponseDonnee isEqualToString:reponseCorrecte])
    {
        message = @"Votre réponse est correcte";
    }else{
        message= @"votre réponse est érronée";
    }
    
    //affica
    UIAlertController* alert =[UIAlertController
                               alertControllerWithTitle:@"Resultat"
                               message:message
                               preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* actionBtnFermer = [UIAlertAction
                                   actionWithTitle:@"Fermer"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction* action){}];
    
    [alert addAction:actionBtnFermer];
    
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
