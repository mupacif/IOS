//
//  ViewController.h
//  03_anatomyDuneClasse
//
//  Created by etudiant on 4/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//nom + scope
//dépasse la frontiere de la classe
@property(nonatomic, strong) NSString* nom;

/*
 le compilateur objectof-c crée uen instance qui contient la valeur
 de la propriété, cette variable d'instance porte, par defaut,
 le même nom de la propriété précédé par le caractère
 -getter - porte le nom de la propriété
 -précédé par un set
 */
@end

