//: Playground - noun: a place where people can play

var tbFormation = ["swift","objectif-c","Cordova","XML","PHP"]

tbFormation.sort(by: < )

func test(_ ok:(Int,Int)->Bool)->Bool
{
    var a="aaa",b="bbb"
    return ok(1,2)
}

test{ $0>$1 }
func a(a:Int=0,b:Int=0)->Bool
{
    return a>b;
}
print(test(a))

var tb=[12,3,657]

let dicChiffres = [0:"Zéro",1:"Un",2:"Deux",3:"Trois",4:"Quattres",5:"Cinq",6:"Six",7:"Sept",8:"Huit",9:"Neuf"]

var tbChiffretraduit = tb.map{
(i)->String in
    var valNum = i
    var cRes = ""
    repeat
    {
        cRes = dicChiffres[valNum%10]! + cRes
        valNum /= 10
    }while valNum > 0
    return cRes
}

print(tbChiffretraduit)
