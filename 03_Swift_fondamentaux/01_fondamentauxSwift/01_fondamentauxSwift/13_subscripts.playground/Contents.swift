//: Playground - noun: a place where people can play

class Personne
{
    var nom:String = ""
    var anneeNaissance: Int = 0

subscript(idx: String)-> Int?
{
    
    switch  idx
    {
    case "bac":
        return anneeNaissance+18
    default:
        return nil
    }
}
}

var p1 = Personne()
p1.nom = "jo"
p1.anneeNaissance = 1978
p1["bac"]

class Formations
{
    var tbFormations = ["Swift","Objective-C","Cordova"]
    var tbDurée = [7,14,6]
    subscript(idx:Int)->String?
    {
        get{
        if(idx >= 0 && idx < tbFormations.count)
        {
            return tbFormations[idx]
        }
        else
        {
        return nil
        }
        }
        set(newValue)
        {
            if idx > 0 && idx < tbFormations.count
            {
                    tbFormations[idx] = newValue!
            }
            else{
                print("L'index \(idx) utilisé n'est pas correct\n La modification n'a pas été faite")
            }
        }
    }//fin subscript(index:Int)->String?
    //doivent différer par nombre d'arguments soit par le type
    subscript(idxChaine:String)->Int?
    {
        get{
            return tbFormations.index(of: idxChaine)
        }
    }
}

var form = Formations()

form[2] = "j'aime "+form[2]!