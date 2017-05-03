//: Playground - noun: a place where people can play

//qu'est-ce qu'une constante?
//valeur non modifiable stocké dans la mémoire
//elle porte un nom(elle a un identifiantà
//inferd
let nbEnfants=2
let nomCours = "Programmation Swift"

//le simple fait d'utiliser (d'écrire) l'idebtifiant
// déterlune la playground de l'afficheur
//l'opérateur + n'est override que pour concantener les
//chaine de caractères

//"Nombtre entants" + bnEnfants


//on peut définir plusieurs constantes en utilisant
//une seule instuction let:

let vitesseMaxAutoroure = 130, voiturePréfére="Aston margin", g=9.81


//on utilise ; pour séparer plusieurs instruction
//écrite sur la même ligne
print(voiturePréfére); print(g)

//si on veut concaténer des valeurs de type
//différentes
//pour obtenir une chaine de caractère, on utilise
//l'interpolation
let msg = "Nombre enfants: \(nbEnfants+3)"

print("🐱")

//variables

var duree = 5
var nomStagiaire = "Pierre"

duree = 10
nomStagiaire = nomStagiaire+" "+"Durand"
//concaténation

var msg2 = nomStagiaire + ", durée:\(duree)"
let msg3 = "\(nomStagiaire) + , durée:\(duree)"
//je peut initialiser une seule fois
//le type peut être donnée explicitement
//parfois cela est nécessaire;
var duréeFromation:Int
let v:Int
v = 5

//exemple avec plusieurs variables:
var cylindrée:Int,prix:Float, moto="Yamaha", couleur:String

// affections différées
cylindrée = 660
prix = 3251.25
couleur = "carbone"

//parfois on doit préciser explicitement le type
//car le compilateur n'affecte pas le type
//souhaité
//var temperature = 16
//temperature = 16,5
var temperature:Float = 16
temperature = 16.5

//on peut déclarer le type en utilisant aussi
//cette syntaxe
var temperature2 = 16 as Float

// même chose pour les constantes
let zéroKelvin: Float = -273
let couleurPréférée: String = "bleu"

//Swift utilise des caractères Unicode
//Cela permet d'utiliser pour les identifiant 
//des constantes, variables, de leurs valeurs,
// des nomes des méthodes, etc

var 😏😏😏 = "i love boobs"
😏😏😏 = "🔞"

print(😏😏😏)

//utiliser les emojis  pour la valeur
var symbolesCarte = "♥️♠️♣️♦️AKQJ"
print("Symboles cartes: \(symbolesCarte)")

//les commentaires par bloc peuvent être imbriqué
/* ceci est un
 /*
    Ceci est un bloc de 
    commentauires imbiruqé
 */
    bloc de commentaires
 */

//booleans
var jaimeSwift: Bool
jaimeSwift = true
//affectation sans déclaration de type
var swiftEstDifficile = false
//précision des float double
var vFloat:Float = 0.123456789123456789
var vDouble:Double = 0.123456789123456789

//litéraux chaine(string literal)
let intBinaire = 0b1001
let intHexa = 0xFA2
let intOcta = 0o25


let v1 = 2.53e2 // 2.53*10^2
let v2 = 0xFp2

//les litéraux chaione peuvent être utilisés
//aussi formatter les valeurs numériques et
//faciliter la lecture

let vAvecZeroAGauche = 0000123.456
let unMilliard = 1_000_000_000
let unMillionEtUnMillionième = 1_000_000.000_001

//converstion entre les valuers numériques
let trois = 3
let pointUnQuatre = 0.14

//let pi = trois + pointUnQuatre // erreur car les valeurs numériques sont de types différents

let pi = Double(trois) + pointUnQuatre

//remarque: la conversion passe par un initialisateur
//(par un 'constructeur') - il ne s'agit donc pas
//d'un cast (d'un transtypage comme en java ou c#)

//cenversion entre les réels
var f1:Float = 5.1
//var d1:Double = f1 //échéc car la conversion implicite
//entre un float et un double n'est pas
//assurée
var d1: Double = Double(f1) //car float et double ne sont pas lié

//déclaration de type de plusiers variables
//(même de type différents)
// sans initialisation
var (a,b,c,d):(Int, Double, String, Bool)

//avec initialisateur
(a,b,c,d) = (1 , 2,"Haha",true);

//avec les 2 types et initialisation
var (u,x,y,z,az):(Int, Float,String,Bool,Any)
= (10,5,"Swift",true,5)

//on peut utiliser le type any pour stocker n'importe quel type de valeur (et cela même
//après avoir affecté uen valeur d'un autre type)
var w : Any
w = u
w = z

//pour tester l'appartenance du contenu d'une variable
//constante à un certain type
//on utilise l'opérateur
//'is'

//pour connaitre le type effectif d'une variable 
//on utilise l'opérateur 'is
var maVariable : Character = "O"
var leTypeTouvé: String
if maVariable is Int
{
    leTypeTouvé = "int"
}else
if maVariable is Float
{
    leTypeTouvé = "Float"
}else
    if maVariable is Double
    {
        leTypeTouvé = "Double"
    }else
        if maVariable is String
        {
            leTypeTouvé = "String"
        }else
            if maVariable is Bool
            {
                leTypeTouvé = "Bool"
}
            else
                if maVariable is Any
                {
                    leTypeTouvé = "Any"
                }
                else
                                        {
                        leTypeTouvé = "Autre"
}

//Tuple: variable ou constancte qui con,tient plusieurs
// valeur individuelles(même de type différents)

var employe = ("Pierre","Martin",100,10.0)
//ou si on impose des types
var employe2:(String,String,Int, Float) = ("","",100,10.0)

//pour décomposer un tuple en valeurs individuelles
//(constantes ou variables) on utilise
employe2.2

let (prenom, nom,annéeNaissance,salaire) = employe

salaire

//la récupération précédente a été faite par position
//si je ne veux extraire qu'une valeur par sa position
//j'utilise la syntaxe
let (_,_,annee,_) = employe
annee

//on peut aussi passer explicitement la position
//comme une sotre d'index
var nomEmploye = employe.1

//on peut aussi utiliser des nom pour les champs d'un tuple
let societe = (nomSociete:"Apple", nbEmploye:2000, ca:2.7e9)

//récupération
let chiffreAffaire = societe.nomSociete
//Swift permet de définir des alias de type
//alias = un nom alternatif(nivkname, surnom)
typealias volRadio = UInt8 // Ce type peur contenir des valeur 0-255

var volumeRadio = volRadio.max
Int8.min

typealias tuple = (String,Int)

var ugu:tuple = ("",0)








