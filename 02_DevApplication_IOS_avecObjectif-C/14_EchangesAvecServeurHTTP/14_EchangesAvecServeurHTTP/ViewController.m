//
//  ViewController.m
//  14_EchangesAvecServeurHTTP
//
//  Created by etudiant on 26/04/2017.
//  Copyright © 2017 -. All rights reserved.
//

#import "ViewController.h"
#import "Util.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtURL;

@property (weak, nonatomic) IBOutlet UIWebView *maWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* urlText = @"http://www.apple.com";
    self.txtURL.text = urlText;
    [self afficherPageWeb:urlText];
   //étape 1
    //je veux charger le contenu d'une page web
    //en utilisant une sessions asynchrine(le chargement aura lieu en background)
    NSURLSession * session = [NSURLSession sharedSession];
    NSURL* url = [NSURL URLWithString:urlText];
    
    // définir la tache à executer par la session
    NSURLSessionDataTask* tache = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable donneesChargees, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //a-t-on chargé des données ..?
        if(donneesChargees == nil)
        {
            NSLog(@"Aucune donnée n'a été chargée");
        }
        NSLog(@"Données chargé");
        NSLog(@"%@",[NSString stringWithUTF8String:[donneesChargees bytes]]);
        //NSLog(@"%@",[NSString stringWithUTF8String:donneesChargees); En Binaire
    }];
    //executer la tache
    [tache resume];
    NSLog(@"La tache a été lancée");
    
    //Etape 3
    // envoyer des informations dormatées en JSON vers un serveur
    //et récupérer se réponse
    
    //Pour pouvoir créer  une chaine json, je dois stocker
    //les données dans un dictionnaire (ou un tableau de dictionnaire)
    //Créer un dictionnaire contenant les données à envoyer au serveur
    NSDictionary* dicInfos = @{
                               @"nombre":@3,
                               @"prefix":@"Ville"
                               };
    
    //jsonifier ce dictionnaire
    NSString* chaineJSON = [Util jsonifierObject:dicInfos];
    NSLog(@"Chaine json : \n%@", chaineJSON);
    //je veux envoyer la chaine JSON au serveur
    //créer l'url
    url = [NSURL URLWithString:@"http://192.168.21.100:8080/ServiceRESTavecJSON/monService/test"];
    
    //pour cela
    //-je dois créer une requête
    NSMutableURLRequest* requete =[[NSMutableURLRequest alloc] initWithURL:url];
    //- configurer la requête (oréciser la méthode de transfer)
    [requete setHTTPMethod:@"POST"];
    //injecter les données dans laa requête attachés à des clées
    //dans mon cas, il ne s'agit que d'une seule chaine à envoyer
    //et je vais l'attacher à une seule clé, dont le nom
    // et attetndu par le serveur
    // notre serveur attend la clé "json"
    NSString* queryString = [NSString stringWithFormat:@"json=%@", chaineJSON];
    //avant d'injecter ce queryString dans la requête, je dois
    // je transformer en
    NSData* dataQueryString = [queryString dataUsingEncoding:NSUTF8StringEncoding];
    //Créer la session de chargement en backgrouind du contenu
    //d'une url
    [requete setHTTPBody:dataQueryString];
    
    session = [NSURLSession sharedSession];
    tache = [session dataTaskWithRequest:requete
         completionHandler:^(NSData * donneesChargees, NSURLResponse * response,
              NSError * error) {
             if(error!=nil)
             {
                 NSLog(@"Erreur:%@", error);
                 return;
             }
             if(donneesChargees == nil)
             {
                 NSLog(@"Aucune données n'a été chargée");
                 return;
             }
             
             //débug: afficher les données recus	
             NSLog(@"%@",[NSString stringWithUTF8String:[donneesChargees bytes]]);
             
             //récuperer le tableau envoyé par le serveur à partir
             //de la chaine JSON
             NSError* erreur = nil;
             NSArray* tb = [NSJSONSerialization JSONObjectWithData:donneesChargees options:0 error:&erreur ];
             
             //parcourir le tableau de dictionnaire et afficher
             //le contentu de chaque dictionnaire
             NSDictionary* dictionnaire;
             for(int i=0;i<tb.count;i++)
             {
                 dictionnaire =tb[i];
                 NSLog(@"Id:%d",[[dictionnaire objectForKey:@"id"] intValue]);
                 
                 NSLog(@"Nom:%@",[dictionnaire objectForKey:@"nom"]);
                 NSLog(@"Population:%d",[[dictionnaire objectForKey:@"population"] intValue]);
                 
                 
             }
             
         }];
    //lancer la tache
    [tache resume];
    
   
    
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
