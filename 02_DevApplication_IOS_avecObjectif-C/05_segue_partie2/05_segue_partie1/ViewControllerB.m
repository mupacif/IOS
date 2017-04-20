//
//  ViewControllerB.m
//  05_segue_partie1
//
//  Created by etudiant on 20/04/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()

@property (weak, nonatomic) IBOutlet UITextField *txtSaisie;
@end

@implementation ViewControllerB

//n'est appelé qu'une seul fois lors de la
//création du controleur
//si le controleur existe déjà et le
//système le réaffiche après un passage par la pile des écrans,
//cette méthode ne sera pas appelée
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//j'utilise la méthode viewWillApprear
//pour peupler le champ txtSaisie avec l'information
//transmise à partir du 1er écran
//cette méthode est appelé systèmatiquemet juste avant
//que le vue n'apparaisse à l'ecran
-(void)viewWillAppear:(BOOL)animated
{
    self.txtSaisie.text = self.textRecu;
}
- (IBAction)btnRetourTouched:(id)sender {
    //on ferme la page 2 et on retourne à la page 1
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"La page 3 a été fermé");
    }];
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
