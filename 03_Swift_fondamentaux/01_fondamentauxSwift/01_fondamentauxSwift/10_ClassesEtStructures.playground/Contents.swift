//: Playground - noun: a place where people can play

//classes et structures: contiennent des données et des traitements
/* caractéristiques communes: 
 -définissent des propriétés
 -définissent des méthodes(des fonctionnalités)
 -définissent des indexeurs
 -définissent des initialisateurs
 -peuvent voir des extentions
 -peuvent implémenter des protocoles(conforme à des protocoles)
 
 
 classes 
 -héritage
 -transtypage de classe (as)
 -déinitialisateur
 -compeur de références(ARC: automatic reference count)
 
 Caract"tistiques présentente seulemet pour les structures
 -les structures ont un initialisateur par defaut
 */

struct MonPoint
{
    //avec val par defauts
    var x:Int = 10
    var y:Int = 10
}

//les strucs ont des initialisateurs par défaut
var unPoint = MonPoint(x: 5, y: 7)

//

unPoint.x

class Voiture
{
    var marque = ""
    var modele = ""
    var cylindré = ""
}

var voiture1 = Voiture()
voiture1.marque = "Aston Martin"

var voiture2 = voiture1
voiture2.marque = "hehe"

voiture1.marque


if(voiture1===voiture2)
{
    print("même références")
}

class Automobile: Equatable
{
    var marque = ""
    var modèle = ""
    var cylindré = 0.0
    public static func ==(lhs: Automobile,rhs:Automobile)->Bool
    {
        return
        lhs.marque == rhs.marque &&
        lhs.modèle == rhs.modèle &&
        lhs.cylindré == rhs.cylindré
    }
}

var au1 = Automobile()
var au11 = au1
var au2 = Automobile()
au2.marque = "hihi"

au1 == au2


//montrez que les instances ne sont pas identiques

au1 === au2
au1 === au11

// on utilise une structure quand
    /*
- on a besoin d'incapsuler des valeurs relativement simples
- on veut que les valeurs encapsulées soient copiée et non pas référencé"s
-on a pas besoin d'héritage
- on ne veut pas définir des initialisateur
*/
