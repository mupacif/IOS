//: Playground - noun: a place where people can play
import Foundation
//Héritage
class Personne
{
    var nom = ""
    var anneeNaissance = 0
    init(nom:String,annéeNaissance:Int)
    {
        self.nom = nom
        self.anneeNaissance = annéeNaissance
    }
    //Propriété calculée en lecture seule
    var description: String
    {
        var txt = "Instance de classe "+String(describing:type(of: self))
        txt += ", nom:" + nom
        
        return txt
    }
    subscript(idx:String)->Int?
    {
    switch  idx
    {
        case "bac":
            return anneeNaissance+18
        case "licence":
            return anneeNaissance+21
        case "maitrise":
            return anneeNaissance+23
        default:
            return nil
    }
    }
    
    func faireDesCourse()
    {
         print("je fais des courses")
    }
    
    final func quiSuisJe()
    {
        print("Je suis un humain")
    }
}

class Employe : Personne
{
    override
    var anneeNaissance: Int
    {
        willSet
        {
            print("tentative de changement de l'année de naissance")
        }
        didSet
        {
            if anneeNaissance < 1900
            {
                print("Année de naissance érroné")
                //année de n'aissance = oldValue 
                //boucle infinie car année naiussance est orrive de la classe Employé
                super.anneeNaissance = oldValue
            }
        }
    }
    
    var salaire = 0.0
    override
    var description: String
    {
        return super.description + "Salaire : " + String(salaire)
    }
}

var tb = [Employe]()
tb.append(Employe(nom: "jo", annéeNaissance: 1056))
tb.append(Employe(nom: "jack", annéeNaissance: 1056))
tb.append(Employe(nom: "john", annéeNaissance: 1056))
//Opérateurs as? 
//-nil si le transtypage ne peut pas avoir lieu
//- l'objet transtypé si le cast peut avoitr lieu
var e:Employe
for i in tb{

      if e = (i as? Employe)!
      {
        print("L'employé \(e.nom)")
      }

}
