//
//  ResultatsRechercheViewContoller.m
//  09_MapView
//
//  Created by etudiant on 24/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ResultatsRechercheViewContoller.h"
#import "CellulePersonnaliseeTableViewCell.h"
#import <MapKit/MapKit.h>
@interface ResultatsRechercheViewContoller ()
@property (weak, nonatomic) IBOutlet UITableView *maTable;

@end

@implementation ResultatsRechercheViewContoller

- (void)viewDidLoad {
    [super viewDidLoad];
    //déclarer que ce controleur fournira les méthodes
    //de remplissage de la table
    self.maTable.dataSource = self;
}
- (IBAction)btnRetourTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//les méthodes du protocoles UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)  tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return self.itemsTrouves.count;
    //return 20;
   
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //récupérer une cellule ayant l'indentification dyu type
    //cellulePersonalisée et dont la position qui lui sera
    // attribuée dans la liste est précisée par l'argument indexPath
    CellulePersonnaliseeTableViewCell* cellule = [self.maTable dequeueReusableCellWithIdentifier:@"celluleResultat"
                                                  forIndexPath:indexPath];
    
    //peupler la cellule
    //exemple
    /*cellule.etqNom.text = [NSString stringWithFormat:@"%@ %li",@"Nom",(long)indexPath.row];
    cellule.etqTelephone.text = [NSString stringWithFormat:@"%@ %li", @"Telephone", (long)indexPath.row];*/
    
    //on va récupérer l'object se trouvant à l'index courante
    //dans items trouvés
    MKMapItem* item = self.itemsTrouves[indexPath.row];
    
    cellule.etqNom.text = item.name;
    cellule.etqTelephone.text = item.phoneNumber;
    return cellule;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
