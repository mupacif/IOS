//: Playground - noun: a place where people can play

var tbEntiers = [Int]();
tbEntiers.isEmpty
tbEntiers.count
tbEntiers=[] //si le type est connu
var tbIntegers: [Int] = []

var tbRempli = Array(repeating:5, count : 5)

var tbFormations = ["Objective-C","Swift","Cordova"]
var tbHeterogene = ["Objective-C","Swift",5] as [Any]

var tbHeterogène:[Any] = ["Objective-C","Swift",5]
var tbHeterogène2:Any = ["Objective-C","Swift",5]

tbFormations.append("Js")

tbFormations += ["nodejs","html","java","hibernate","sprint","jee"]

tbFormations[1]="swift 3,2"
tbFormations

tbFormations[1...2]
tbFormations[1...2]=[]
tbFormations

tbFormations.remove(at: 0)
tbFormations

for(index,formation) in tbFormations.enumerated()
{
    print("\(index+1):\(formation)")
}

var setChiffres: Set = ["nodejs","html","java","hibernate","sprint","jee"]

setChiffres.remove("nodejs")

var idx=setChiffres.index(of: "html");

setChiffres.contains("jee")

setChiffres.sorted(by:>)

setChiffres.sorted(by:{$0>$1})

setChiffres.sorted(by:{a1,a2 in a1>a2})

//Dictionaire

var dicCodesCouleurs:[Int:String]=[Int:String]()

dicCodesCouleurs[255] = "bleu"
dicCodesCouleurs[16250] = "vert"
dicCodesCouleurs[0xffff] = "rouge"


dicCodesCouleurs

var dicCapitales = ["Belgique":"Bruxelles","Angleterre":"Londre","USA":"washigton"]

dicCapitales["USA"]=nil
dicCapitales


//parcour

for (clé,valeur) in dicCapitales
{
    print("\(clé):\(valeur)")
}

for clé in dicCapitales.keys
{
    print("\(clé)")
}

for valeur in dicCapitales.values
{
    print("\(valeur)")
}


var tbKeys = [String](dicCapitales.keys)

var tbValues = [String](dicCapitales.values)

