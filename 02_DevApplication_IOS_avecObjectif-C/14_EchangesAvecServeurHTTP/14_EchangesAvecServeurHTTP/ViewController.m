//
//  ViewController.m
//  14_EchangesAvecServeurHTTP
//
//  Created by etudiant on 26/04/2017.
//  Copyright © 2017 -. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtURL;

@property (weak, nonatomic) IBOutlet UIWebView *maWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //étape 1
    //je veux charger le contenu d'une page web
    //en utilisant une sessions asynchrine(le chargement aura lieu en background)
    NSURLSession * session = [NSURLSession sharedSession];
    NSURL* url = [NSURL URLWithString:@"http://www.greceanu.com/default.html"];
    
    // définir la tache à executer par la session
    NSURLSessionDataTask* tache = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable donneesChargees, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Données chargé");
        NSLog(@"%@",[NSString stringWithUTF8String:[donneesChargees bytes]]);
        //NSLog(@"%@",[NSString stringWithUTF8String:donneesChargees); En Binaire
    }];
    //executer la tache
    [tache resume];
    NSLog(@"La tache a été lancée");
}

- (IBAction)btnChargerTouched:(id)sender {
    [self afficherPageWeb: self.txtURL.text];
}

-(void) afficherPageWeb:(NSString*) urlTexte
{
    //plus haut j'ai utilisé la méthode
    // [NSURL URLWithString:...]
    //Mais on peut créer une NSURL aussi avec
    NSURL* url = [[NSURL alloc] initWithString:urlTexte];
    //pour afficher la page il faut d'abord la charger
    //pour charger la page; il faut commencer par créer une
    //requête
    NSURLRequest* requete = [NSURLRequest requestWithURL:url];
    //envoyer ma requête vers le serveur et charger sa réponse
    //dans la WebView
    [self.maWebView loadRequest:requete];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
