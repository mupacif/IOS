//
//  ViewController.m
//  10_UITableView_CellulePerso_	MasterDetails
//
//  Created by etudiant on 21/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Gateau.h"
#import "maCellule.h"
#import  "DetailsViewController.h"
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
                     ].mutableCopy;
    
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

//overrider la méthode  du protocol UITableViewDatasource qui
//retourne le nombre de section de ma table
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


//méthode qui doit retourner le nombre de ligne
//de la section passée en paramère
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tbGateaux.count;
}
//méthode qui doit
// - se procurer une cellule
//- la remplir
//remarque: la section et la ligne de la cellule sont passées
//dans l'argument indexPath
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //récupérer une cellule
    maCellule* cellule =
    [self.maTable dequeueReusableCellWithIdentifier:@"maCellulePersonnalisee"];
    if(cellule ==nil)//aucune cellule reutilisable n'a été trouvée
    {
        cellule = [[maCellule alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:@"maCellulePersonnalisee"];
    }
    //remplir la cellule obtenue
    //j'utilise la position de la cellule (la ligne où elle se trouve)
    //pour récuper à partir du tableau de gateau
    //le tableau correspondant à cette ligne
    Gateau* gateau = self.tbGateaux[indexPath.row];
    
    cellule.imgGateau.image =[UIImage imageNamed:gateau.nomImage];
    cellule.etqTitre.text = gateau.nom;
    cellule.etqDescription.text = gateau.texte;
    
    return cellule;
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //récupérer l'index de la ligne qui a été touché
    //selectionnée
    
    //on commence par récupérer l'indexPath(les information complète) de la ligne
    //de la ligne sélectionné
    NSIndexPath* indexPath = [self.maTable indexPathForSelectedRow];
    
    NSInteger idxLigneSelectionnee = [indexPath row];
    
    //Récupérer le gateau qui se trouve à cet index
    Gateau* gateau = self.tbGateaux[ idxLigneSelectionnee];
    //je dois fournir ce gateau au 2e
    //controleur de détails
    
    //je récupère le controleur de details
    //du ségué(car le controleur est ma destination
    //de la transition)
    DetailsViewController* destination =(DetailsViewController*) [segue destinationViewController];
    destination.gateau = gateau;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
