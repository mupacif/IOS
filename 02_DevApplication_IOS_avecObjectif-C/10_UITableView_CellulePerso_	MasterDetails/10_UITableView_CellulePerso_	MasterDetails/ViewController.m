//
//  ViewController.m
//  10_UITableView_CellulePerso_	MasterDetails
//
//  Created by etudiant on 21/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Gateau.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *maTable;
@property (nonatomic,strong) NSMutableArray* tbGateaux;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tbGateaux=@[
                     [[Gateau alloc] initNom:@"Gateau au chocolat"
                                    nomImage:@"gateauChocolat.jpg"
                                 description:
                      @"Le gateau le plus délicieux qui puisse exister"],
                     [[Gateau alloc] initNom:@"Méringue"
                                    nomImage:@"meringue.jpg"
                                 description:
                      @"La meringue est une pâtisserie très légère et très fine composée uniquement d'un mélange de blancs d'œufs et de sucre. Un peu d'acide peut être ajouté sous forme de citron ou de tartre."],
                     [[Gateau alloc] initNom:@"Tarte aux pêches"
                                    nomImage:@"tartePeches.jpg"
                                 description:
                      @"Tartes familliales "],
                     [[Gateau alloc] initNom:@"Tiramisu"
                                    nomImage:@"tiramisu.jpg"
                                 description:
                      @"N'hésitez plus: pour votre prochain dîner, offrez-vous cette spécialité"]                     
                     ];
    
    //les méthodes utilisées pour peupler la table se trouvent ici
    //ici dans la classe ViewControler
    //effectivement, dans ViewController.h nous avons déclaré
    //que cette classe est conforme au protocole
    //UITableViewDataSource
    //Donc, la classe ViewController a été transformée en délégué
    //de la table
    //je précise ceci dans le code
    self.maTable.dataSource = self;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
