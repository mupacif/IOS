//: Playground - noun: a place where people can play
import Foundation
for i in 5 ... 8
{
    print("\(i)*2=\(i*2)")
}




let base = 5
let puissance = 3
var resultat = 1

for _ in 1...puissance
{
   resultat*=base
}
resultat

resultat = 1
var compteur = 1

while compteur <= puissance
{
    resultat *= base
    compteur += 1
}

resultat

resultat = 1
compteur = 1
repeat
{
    resultat *= base
    compteur += 1
} while compteur<=puissance
resultat

// utiliser l'instruction if pour calculer 
//l'impot en connaissant
// le salaire et
// mes seuls d'imposition(15000,25000,40000)
// - le taux d'imposition (0,10,30,50)
//Tester avec les salaires 12000,18000,32000,65000



var impot: Double?=0.0
var salaires: [Double] = [12000,18000,32000,65000]

var test = ""
for salaire in salaires
{
if salaire >= 15000 && salaire < 25000 {
    test = "1"
    impot = (salaire - 15000) * 0.10
}
else if salaire >= 25000 && salaire < 40000
{
    test = "2"

    impot = (salaire - 25000) * 0.30 + 10_000*0.1
}
else if salaire >= 40000
{
    test = "3"

    impot = (salaire-40000) * (0.50) + 10_000*0.1 + 15_000*0.3
}
    print("\(test) \(salaire) : impot:\(impot)")
}


var formation = "Swift", duree : Int=0

switch formation.lowercased()
{
    case "cordova":
        duree = 6
    case "swift", "objective-c":
        duree = 13
default:
        duree = 5

}


for salaire in salaires
{

switch salaire {
case 0..<15_000:
    impot = 0
case 15_000..<25_000:
    impot =  (salaire - 15000)*0.1
case 25_000..<40_000:
    impot =  (salaire - 25000)*0.3 + 10_000*0.1
default:
   if salaire < 0
   {
    print("le salaire ne peut pas être négatif")
    impot = nil
    }
    else
   {
    impot = (salaire-40000) * (0.50) + 10_000*0.1 + 15_000*0.3
    }
}
if impot != nil
{
    print("Le montant de votre impot:\(impot!) sur un salaire de \(salaire)")
}else{
    print("L'import n'a pas pu être calculé")
}
}

/**
 *
 * switch de type
 *
 */
print("\n\n\n")
let prixDurée = (3000.0,20)
switch prixDurée {
case (1500 ..< 2500, 3 ..< 6):
        print("1500 à 2500€, 3 à 6 jours, pas de formations pour vous")
default:
    print("nous n'avos pas trouvé de formation convenable pour vous")
}

//-*********************
switch prixDurée {
case (let lePrix, 4...6):
    
        print("Pour les formations de 4 à 6 jours qui coutent \(lePrix), nous vous proposons un prix de seulement \(lePrix*0.8)")
case (2000, let laDurée):
        print("pour les formations de 2000 euros, reduc de 20 e /jour pour vous : \(laDurée*20)")
case let(lePrix,laDuree):
        print("votre prix promotionnel:\(lePrix-Double(10*laDuree))")
default:
    print("moth")
}

//-**********************

let uneFormation = ("Java",2000.0, 5)
switch uneFormation {
case let (nom,prix,duree) where nom=="PHP" && prix/Double(duree) < 600:
    print("Cest une formation PHP qui coute \(prix) et dont le prix/jour est inférieur à 600")
case let(nom, _, _) where nom == "Java":
    print("il s'agit d'une formation \(nom)")
case let(nom, prix, duree):
    print("formation : \(nom), prix:\(prix), duree:\(duree)")
/*default:
    print("Default")*/
}



var tbFormation = ["javascript", "html", "nodejs", "hibernate", "Spring", "cordova"]
for formation in tbFormation
{
     if !formation.lowercased().contains("va")
     {
        continue
    }
    print("\t"+formation)
}

formation = "swift"
duree = 0
switch formation.lowercased() {
case "cordova":
    duree = 13
    if formation.lowercased() == "objective-c"
    {
        break
    }
    duree += 2
default:
    break;
}

// boucle nommé
var i = 0
ok:
while(true)
{
if(i == 100)
{
    
    print(i)
    break ok
}
    i+=1
}


//guard

func testTable(_ tb: [String:Any])
{
    guard let nom = tb["age"] else
    {
        print("pas de nom age trouvé")
        return
    }
    
    print("Vous avez \(nom) ans")
    
}

testTable(["age":5])


