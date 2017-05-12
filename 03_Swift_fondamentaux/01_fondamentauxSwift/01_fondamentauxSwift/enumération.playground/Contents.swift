//: Playground - noun: a place where people can play


enum lane {
    case top(String)
    case bot
}

enum Civilité{ case monsieur,madame,mademoiselle}
var civilité:Civilité

civilité = Civilité.madame

switch civilité
{
case .monsieur:
    print("hehe")
default:
    print("def")
}


enum Formations:String{
    case java = "Java"
}

enum MoyensDeTransport:Int
{
    case voiture=3, métro, tramway,bus, taxi, avion;
}

MoyensDeTransport(rawValue: 5)
var mdt:MoyensDeTransport
if let moyen = MoyensDeTransport(rawValue: 5)
{
    mdt = moyen
}else
{
    print("moyen de transport innéxistant pour ce raw")
}

var formation = Formations.java

print("formation: \(formation), raw value:\(formation.rawValue)")
var go : lane
go = .top("hoho")

// énumération nommé
switch go
{
case .top(let name):
    print("\(name)")
default:
    break;
}

// enumération typé
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

var ACC = ASCIIControlCharacter.tab
ACC

// récupération du nom
enum CompassPoint: String {
    case north, south, east, west
}

CompassPoint.south.rawValue

// nommer les case
CompassPoint(rawValue: "south")

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

Planet(rawValue: 2)

enum ExpressionArithmetique
{
    case nombre(Int)
    indirect case addition(ExpressionArithmetique,ExpressionArithmetique)
    indirect case multiplication(ExpressionArithmetique,ExpressionArithmetique)
}


let un = ExpressionArithmetique.nombre(1)
let deux = ExpressionArithmetique.nombre(2)

let op1 = ExpressionArithmetique.addition(un, deux)

func evaluer(_ ea:ExpressionArithmetique)->Int{
    
    switch ea{
    case let .nombre(valeur):
        return valeur
    case let .addition(exp1,exp2):
        return evaluer(exp1)+evaluer(exp2)
    case let .multiplication(exp1,exp2):
        return evaluer(exp1)*evaluer(exp2)
    }
}

evaluer(op1)


enum TypeTVA
{
    case TVA2, TVA5, TVA20
    init(valeur:Int)
    {
        switch valeur {
        case 2:
            self = .TVA2
        case 5:
            self = .TVA5
        default:
            self = .TVA20
        }
    }
    init(valeur:String)
    {
        switch valeur.lowercased() {
        case "tva2":
            self = .TVA2
        case "tva5":
            self = .TVA5
        default:
            self = .TVA20
        }
    }
}

var valTVA: TypeTVA
valTVA = TypeTVA(valeur: 2)
valTVA = TypeTVA(valeur: "tVA2")