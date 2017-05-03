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
nombre = Int("Bonjour");

//var nb= nil // ni n'est pas accepté si la 
              //variable n'est pas un optional

// Déclarer et attribuer une valeur à un ptional
var nbEnfants: Int? = 3
nbEnfants = nil

//par défaut, la valeur d'un ptional non
//initialisé est nil:
var société: String? 
