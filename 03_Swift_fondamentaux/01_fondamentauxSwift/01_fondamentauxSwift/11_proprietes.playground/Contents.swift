//: Playground - noun: a place where people can play

//propriétés - les propriétés associent des valeurs à une classe, structure ou énumération
//on distingue
//- des propritétés 'stored' - propriétés de stockage, propriétés stoqué
//- des propriétés calculées 

//stored properties
// autres propriétés

import Foundation
struct DonnéesStitiquesEmploye
{
    var ancienneté:Int
    var annéeEmbauche: Int
}

var dse = DonnéesStitiquesEmploye(ancienneté: 0, annéeEmbauche: 2010)

var date = Date()//importation Foundation nécessaire
var calendar = Calendar.current
var anneeCourante = calendar.dateComponents([.year], from: date).year!


dse.ancienneté = anneeCourante - dse.annéeEmbauche

//une propriété  de sotckage peut être 'lazy'
//si une propriété est 'lazy', sont initialisation sera retardé(décal"")
//jusqu'au moment ou propriété est accédée en lecture la 1er fois
//supposons qu'une classe Etude a besoin d'un nom et du prénoom du stagiaire


class Etude
{
    var tbEtudes: [String] = []
    //initialisateur qui a besoin du nom et du prénom du stagiaire
    init(_ nom:String,_ prenom:String)
    {
        print("Création d'une instance Etude pour \(prenom) \(nom)")
        //normallement je dois chercher els études du stagiaire
        //dont le nom/prénom nt été données dans uen DBM//ici on va les donner dans le code
        tbEtudes.append("Swift")
        tbEtudes.append("Objectif-c")
        tbEtudes.append("Cordova")
        
    }
}

class Stagiaire
{
    var nom : String = ""
    var prenom : String = ""
    // la propriété suivante contient une in,stan,ce de tyope Etude
    //qui ne peut être créer quy'après la création d'un stagiaire
    //il faut donc retarder sa création en la déclarant lazy
    lazy var etude: Etude = Etude(self.nom, self.prenom)
}

var stagiaire = Stagiaire()

//on constate que le msg a afficher lors de la création de la valeur
// de la pripriété ét n'est pas présent -> l"instance de Etudde n'a
//pas encore été créee

stagiaire.nom = "Durand"
stagiaire.prenom = "Pierre"

var v1 = 5
var v2 = 6

var vGlobalCalculée : Int
{
    get
        {
            return v2-v1
    }
}

print(vGlobalCalculée)

//propriété de type (ou propriété static)
//propritét statique  = propriété qui appartient à un type(et non pas à une instance).
//une telle propriété existe même si aucune instance n'a été créer

//remarques:
//-ces propritété doivent toujours avoir une valeur par défault
//-ces propriétés sont de type 'lazy' (donc on ne doit pas utiliser explicitement le mot clé 'lazy'
//utiliser explicitement le mot clé lazy

struct maStruct
{
    static var propStoqué = "Valeur propriété"
    static var propCalculé: Int{
        get{
            return 1;
        }
    }
}

class Auto:CustomStringConvertible
{
    static var vitesseMaxAutoroute = 120
    static var vitesseMaxRouteDepartementale: Int
    {
        return 90
    }
    static var  delta: Int
    {
            return vitesseMaxAutoroute - vitesseMaxRouteDepartementale
    }
    var description:String
    {
        return "personne:ok"
    }
    
}

