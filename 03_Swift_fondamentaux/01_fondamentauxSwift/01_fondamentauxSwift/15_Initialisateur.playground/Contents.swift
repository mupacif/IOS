//: Playground - noun: a place where people can play

//inititlaisateur


//méthode spéciale comme en java

struct Velo
{
    var nbRoues : Int
    var nbVitesses = 18
    init()
    {
        nbRoues = 2
    }
}

var velo = Velo()

class Client{
    var nom:String
    var anneeNaissance: Int?
    //pour les valeur optional je ne peut pas donenr de valeur à l'initialisateur
    init(nom:String)
{
    self.nom = nom
    }
}