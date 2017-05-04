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

