//: Playground - noun: a place where people can play

// Selon le nombre d'opérands, on distingue
//des opérateurs
//- unaires
// - binaires
// - ternaires

// opérateur d'attrivution(binaire)
let nb = 5
var v:Int
v = nb
let (x,y) = (250,300)
x
y

//attention en swift, l'opérateur d'attribution
//ne retourne rien
// on ne peut pas donc enchainer 2 attribution
let v2 = v = 3

//ou encore un test et une attribution
/*
 if 3 ==(v = 3)
 {}
 */
//ceci évite des erreurs de codage comme la suivant
/*
 if v=3 //utilisation erroné de l'opérateur =
 //au lieu de ==
 {}
 */

//opérateurs arithmétiques(qui sont des opérateurs binaires)
//+,-,*,/,% module

//En swift, ces opérateur n'autorisent opas le 
//depassement 
//pour autoriser le dépassement il faut utiliser 
//l'opérateur de dépassement

v=Int.max &+ 1
//v =UInt.max &+1 //erreur car les valeurs négatives ne sont pas autorisées par ce type
//les opérateurs unaires + et -
var solde = -50
//var solde2 = +50 //instruction non accepté ("ambigous")
//opérateurs d'assignation composés
//+=,-=,/=,%=
v = 5
v += 2
//swift 3 ne connait plus ++ et --
// v++

//opérateur de comparaison
2==2
2 > 3
v < v

//on peut comparer les tuples, seulement si
//s(ils ont le même nombre de valeurs
//-leur valeurs son compatables

("swift",5)  < ("swift",2)

(3,"bonjour")==(5-2,"bon"+"jour")

//opérateur nil-coalesc
// a??b
// l'opérateur coalescing précédent 
// 1. débale l'optionnel 'a' si cette optional contient une valeur et retourne la valeur débalée

// 2. retourne la valeur de l'expression b sinon

var formation:String? = "java"

var stage = formation ?? "swift"+",objectif-c"

//a ?? n est l'équivalent de l'expression ternaire suivante 
//a != nil? a!:b 


