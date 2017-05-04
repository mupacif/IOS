//optional

//swift ne permet pas l'utilisation d'une variable
//non initialisée
//parfois cette initialisation nep eut pas être
//faire, à un moment donnée
//Dans ce cas, on utilise un ptional

//un optional est une enveloppe qui peut contenir
//-une valeur ou référence d'un objet
//-out rien du tout

//Très souvent , les fonctions/Méthode/ initialsateur
//retourner un optional
//Exemple

var nombre = Int("121");
//nombre = Int("Bonjour");

//var nb= nil // ni n'est pas accepté si la 
              //variable n'est pas un optional

// Déclarer et attribuer une valeur à un ptional
var nbEnfants: Int? = 3
nbEnfants = nil

//par défaut, la valeur d'un ptional non
//initialisé est nil:
var société: String?

//pour tester si un optional contient une valeur
//on peut utiliser 2 méthodes bas"es sur un test
// 'if'

//je veux récupérer le nombre d'enfants si
// l'optional (l'enveloppe) contient cette informations
//ou afficher un message sinon
var nb: Int
if nbEnfants != nil
{
    nb = nbEnfants! // déballage explicite, retourne la valeur optionel
}
else{
    
        print("loptional nbEnfants ne contient rien")
}
//2e façon de tester l'existeance ou la non
//existence du contenu est le
//binding de l'option (optional binding)
if let nTmp = nbEnfants
{
    print("Nombre d'enfants:\(nTmp)")
}
else
{
    print("L'option nbEnfants ne contient rien")
}
//tentantive d'utiliser nTmp à l'extérier du else if
//la variable a été définie
//On peut inclure plusieurs optional bindings et des expressions
// qui retournent des booleans dans un même test mais il faut les 
//séparer par ','
if let n1 = Int("1"), let n2 = Int("2"),n1<2,n1+n2<5
{
    print("\(n1)+\(n2)<5")
}else
{
    print("L'opération a échoué")
}
//tester le type d'un optionel 
if nbEnfants is Int?
{
    print("ok");
}

//autre possibilités
type(of: nbEnfants)

var leType = String(describing: type(of: nbEnfants))
if leType.hasPrefix("Optional")
{
    print("optional")
}
