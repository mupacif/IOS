//
//  Personne.m
//  13_initialisation
//
//  Created by etudiant on 4/14/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Personne.h"

@implementation Personne

//tableau d"finissant les civilités format texte
//AU FORMAT TEXTE ("m", "Mme","Mlle")
//instruction du language c
// le même pour toutes les instances
static NSArray* tbCivilitesTexte = nil;
-(id) initAvecNom:(NSString *)nom etAvecPrenom:(NSString *)prenom
{
    if(self=[super init])
    {
        self.nom = nom;
        self.prenom = prenom;
    }
    return self;
}
-(id) initAvecAnneeNaissance:(int)aneeNaissance
{
    if(self=[super init])
    {
        self.anneeNaissance = aneeNaissance;
    }
    return self;
}
// initialisateur désigné (designated initialiser)
-(id) initAvecCivilité:(int)civilite
avecNom:(NSString*)nom
avecPrenom:(NSString*)prenom
etAvecAnneeNaissance:(int)anneeNaissance
{
    if(self=[super init])
    {
        @try
        {
        self.nom = nom;
        self.prenom = prenom;
        self.civilite = civilite;
        self.anneeNaissance = anneeNaissance;
        }
        @catch(NSException *e)
        {
            NSLog(@"Exception levée: %@", e.name);
            NSLog(@"Exception levée: %@", e.reason);
        }
        @finally
        {
            NSLog(@"finally");
        }
    }
    return self;
}
//personnaliser les setters
-(void) setNom:(NSString*) nom
{
    if(![Personne verifierNomOuPrenom:nom])
    {
        NSAssert(false,@"Mauvais nom");
        //version 2
        NSException *ex = [NSException
                           exceptionWithName:@"NSException" reason:@"le nom doit avoir entre 2 et 15 charactère" userInfo:nil];
        //lever l'ex
        @throw ex;
    }else{
        _nom = nom; // pas de self.nom = nom car cela déboche 
        
    }
}

+(BOOL) verifierNomOuPrenom:(NSString*) nomOuPrenom
{
    return (nomOuPrenom!= nil && nomOuPrenom.length>=2&&nomOuPrenom.length <=15);
}
//version 2
//initialisateurs de convénience(convenience initializer)
//initialisateurs secondaires
/*-(id) initAvecNom:(NSString *)nom etAvecPrenom:(NSString*)prenom
{
   /*   NSDate* dateCourante = [NSDate date];
    //récuperer un composant de la date
  NSDateComponents* components = [[NSCalendar currentCalendar] components:NSCalendarUnitSecond
                                    | NSCalendarUnitMinute |  NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear
        
                                                                   fromDate:dateCourante];
    
    int année = (int) [components year];
    int jour = (int) [components day];

    return [self];
}*/
-(id) init
{
    NSAssert(FALSE,@"Pas de constructeur sans parametres");
    return nil;
}
//constructeur de classe
-(void) initialize
{
    NSLog(@"initialisateur de la classe");
    //cet initialisateur est appelé qyuand la classe personne
    // est crée mais aussi quand ses sous-classes sont créée aussi
    //par exemple le double appl de cet init
    
    //Pour empecher le double appel de cet initialisateur par les classes
    //dérivées, on peut faire le test suivant
    if([self class]== [Personne class])
    {
        tbCivilitesTexte = @[@"Monsieur",@"Madame",@"Mademoiselle"];
    }
}
-(void) afficherInfos
{
    NSLog(@"%@ %@ %@, né en %d",
          [tbCivilitesTexte objectAtIndex:self.civilite],
          self.prenom,
          self.nom,
          self.anneeNaissance);
}
@end
