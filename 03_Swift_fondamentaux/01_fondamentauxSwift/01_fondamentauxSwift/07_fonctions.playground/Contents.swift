//: Playground - noun: a place where people can play


func trouverMinMax(_ tb:[Int])->(vMin:Int,vMax:Int)?
{
    var min : Int, max : Int
    guard !tb.isEmpty else {
        return nil
    }
    min = tb[0]
    max = tb[0]
    var count = 0
    for i in tb[1..<tb.count]{
        count += 1
        if i < min
        {
            min = i
        }
        else if i > max
        {
            max = i
        }
    }
    count
    return (min,max)
}

trouverMinMax([])

//si le tableau est vide, la méthode précédente plante
//car la récupération 
//var mib = tb[0]
//ne peut pas avoir lieu

