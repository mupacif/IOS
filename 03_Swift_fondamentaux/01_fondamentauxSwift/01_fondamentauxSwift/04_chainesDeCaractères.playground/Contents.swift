import Foundation
//: Playground - noun: a place where people can play

let formation = "programation avec swift"

//pour créer une chaine vide

var emptyString = ""
var emptyString2 = String()

emptyString.isEmpty ? "la chaine est vide" : "la chaine n'est pas vide"

emptyString.characters.count == 0 ? "vide":"no vide"


for c in formation.characters
{
    print(c)
}

//construire à partir d'un tabkleau de caractères à l'aide d'un initialisateur
let caractères: [Character] = ["j","'","a","m","e"," ","🐓"];

let jaime = String(caractères);
print("*********")
//autre initialisateur
// a a déjà utilisé String(describing:)
for i in 0..<caractères.count
{
    print(caractères[i])
}

let v = 5
var message = "\(v)*0.123456789=\(String(format: "%.3f",Double(v)*0.123456789))"

//attention, la directive 'import Foundation' est nécessaire
//en swift, les chaines de caractères ne sont pas indexés par
//une entier mais par des valeurs de tupe String.index(qui est une structure)
//pout naviguer à l'intérieur d'un string, 2 index sont importante
//-startIndex
//-endIndex

var salut = "bonjour swift"
var idxStart = salut.startIndex
//quel est le type de cette variable
String(describing: type(of: idxStart))

//ou
idxStart is Int // String.index

//erreur un string.index ne peut pas être modifié en utilisant
//des additions soustraction de valeurs de type int
idxStart

//calculer la distance entre 2 String.index
var intIndexFin = salut.distance(from: salut.startIndex, to: salut.endIndex)
intIndexFin


salut[salut.startIndex]
salut.characters[salut.startIndex]

//pour obtenir un index qui est juste avant la position d'un autre
//index on tuilise "before"
var idx = salut.index(before: salut.endIndex)
salut[idx]

//récupérer le 2e caractères

salut[salut.index(after: salut.startIndex)]

//récupérer tous les index entre startIndex et endIndex

var interval = salut.startIndex..<salut.endIndex
salut[interval]

//sans le 1er et le dernier caractère
interval = salut.index(after: salut.startIndex)..<salut.index(before:salut.endIndex)

salut[interval]

//parcourir la chaine avec une boucle et after
// utiliser la distance() pour afficher l'index en tant qu'entier
idx = salut.startIndex
while idx != salut.endIndex
{
    var pos = salut.distance(from:idx,to:salut.endIndex)
    print("salut[\(pos)]=\(salut[idx])")
    idx = salut.index(after: idx)
}

print("----with before----")
//fa!ire la même chose avec before

idx = salut.endIndex
repeat {
    idx = salut.index(before: idx)
   var pos = -salut.distance(from:salut.endIndex,to:idx)
    print("salut[\(pos)]=\(salut[idx])")
    
}while idx != salut.startIndex

print("l'offset peut être négatif")
var idx2 = salut.index(salut.endIndex, offsetBy: -3)
salut[idx2]

//quand on travaiol avec offsetBy on peut dépasser les limites(ce qui p^rovoque une erreur)
//pour eviter cela, on utilise limitedBy
//si un dépassemet est cosntanté, l'optional retourné par la méthode
//index() contient nil

var décalage = 100 //10
if let ix = salut.index(salut.startIndex, offsetBy:décalage, limitedBy:salut.endIndex)
{
    print(salut[ix])
}else
{
print("votre offset est trop grande")
}

print("***Indexes***")
//obtenir les indices 
salut.characters.indices

for ix in salut.characters.indices
{
    print(salut[ix],terminator:", ")
}

var chaine = "il fait beau en éte"
chaine.characters.count

//ajouter le caractère 0301 (voir https://unicode-table.com/en/#latin-extended-b) qui est l'appostrophe

chaine += "\u{0301}"
chaine.characters.count

//insertion et suppression
chaine = "bone annee"
chaine.insert("n", at: chaine.index(chaine.startIndex,offsetBy:3))
chaine.insert("\u{0301}", at: chaine.index(chaine.endIndex,offsetBy:-1))

//insérer uen chiane de caraxtères
chaine.insert(contentsOf: "et heureuse ".characters, at: chaine.index(chaine.startIndex, offsetBy:6))


//supprimer 1 caractère
//la fonction remove() retourne le caractère supprimé
chaine.remove(at: chaine.index(chaine.endIndex, offsetBy:-2))
chaine

//pour supprimer uen souschaine contenue entre 2
//limites (contenue dan,s un intervalle) je dois:
//- d"finir l'intervalle
// - utiliser la méthode removeSubRange(intervalle)
interval = chaine.index(chaine.startIndex, offsetBy:6)..<chaine.index(chaine.startIndex,offsetBy:18)
chaine.removeSubrange(interval)



let tbFormations = [
                "Java",
                "Swift",
                "Objectif-c",
                "Javascript",
                "Cordova"
]

//compter le nombre de formations qui commencent par "Ja"
var nb = 0
for formation in tbFormations
{
    if formation.hasPrefix("Ja")
    {
        nb+=1
    }
}
print("\n\(nb) formations commencant par 'ja'")

nb = 0
for formation in tbFormations
{
    if formation.hasSuffix("va")
    {
        nb+=1
    }
}
print("\n\(nb) formations commencant par 'va'")

extension String{
    func trim1() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    func trim2() -> String {
        let cs = CharacterSet.init(charactersIn: " !")
        return self.trimmingCharacters(in: cs)
    }
}

chaine = "  Bonjour Objectif-c et swift  !"
print("*\(chaine.trim1())*")
print("*\(chaine.trim2())*")