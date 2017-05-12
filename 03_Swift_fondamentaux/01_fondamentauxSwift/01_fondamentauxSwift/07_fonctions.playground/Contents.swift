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


func creerAffichageMessage(_ destinataire:String, _ avecAffichage:Bool = false)->String{
    if(avecAffichage)
    {
        print(destinataire)
    }
    return "destinataire"
}



creerAffichageMessage("hoho")

func Display(liste:Any...)
{
    var nb : Int = 0
    
    for i in liste
    {
        
        if let a = i as?Int
        {
         nb = a
        }
        else if let a = i as?Double
        {
           nb = Int(a)
        }
        print(nb)
    }
    
}

Display(liste: 1,2,3,5.54,4,5)

func calculerTTC(prixHT:Double, typeTVA:String)->Double{
    var coef:Double
    if prixHT < 0
    {
        fatalError("le prix est négatif")
    }
    
    //TVA(2,5,20)
    switch typeTVA {
    case "TVA2":
        coef=0.02
    case "TVA5":
        coef=0.05
    case "TVA20":
        coef=0.2
    default:
        coef=0.00
    }
    
    return prixHT*(1+coef)
}

var ht: Double = 100
var ttc = calculerTTC(prixHT: ht, typeTVA: "TVA20")

func calculerTTC2(prixHT:Double,avecTVA typeTVA:String)throws ->Double{
    var coef:Double
    if prixHT < 0
    {
        fatalError("le prix est négatif")
    }
    
    //TVA(2,5,20)
    switch typeTVA {
    case "TVA2":
        coef=0.02
    case "TVA5":
        coef=0.05
    case "TVA20":
        coef=0.2
    default:
        throw ErreursTVA.ErreurTypeTVA("Type de tva inconnue:\(typeTVA)")
    }
    
    return prixHT*(1+coef)
}

enum ErreursTVA:Error
{
    case ErreurTypeTVA(String)
}
// try and catches
do{
    ttc = try calculerTTC2(prixHT: ht, avecTVA: "TVA21")
    print("Prix ht:\(ht), prix TTC \(ttc)")
}catch ErreursTVA.ErreurTypeTVA(let msg)
{
    print(msg)
}


//var défini par un fonction
var vCalculerTVA: (Double,String)throws ->Double = calculerTTC2
// try and catches
do{
    ttc = try vCalculerTVA(ht, "TVA21")
    print("Prix ht:\(ht), prix TTC \(ttc)")
}catch ErreursTVA.ErreurTypeTVA(let msg)
{
    print(msg)
}



func calculerAfficherTTC20(_ ht: Double, _ maFonction: (Double,String)throws->Double)->Double{
    var out : Double = 0
    do{
       out = try maFonction(ht, "TVA21")
        print("Prix ht:\(ht), prix TTC \(ttc)")
    }catch ErreursTVA.ErreurTypeTVA(let msg)
    {
        print("from inside: \(msg)")
    }
    catch
    {
       print("error fatale")
    }
    return out
}

calculerAfficherTTC20(ht, calculerTTC2)

var addition:(Double,Double)->Double={$0+$1}
var multiplication:(Double,Double)->Double={$0*$1}
var soustration:(Double,Double)->Double={$0-$1}
var division:(Double,Double)->Double={$0/$1}

typealias opé = (Double,Double)->Double
var dicOpération = [String:opé]()
dicOpération["+"]=addition
dicOpération["-"]=soustration
dicOpération["/"]=division
dicOpération["*"]=multiplication
func choixFunc(opérateur:String)->((Double,Double)->Double)?
{
    
    return dicOpération[opérateur]

}

choixFunc(opérateur: "+")!(1,2)

var tab:([Int])->Void = {(t:[Int]) in print("hello")}