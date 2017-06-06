//en swift les erreurs sont representé par des valeurs


//le type peut être une classe, enum,etc.., ils doivent implémenter un protocole

enum ErreursCryptage : Error
{
    case ChaineVide // a lever qyabd ka chaine a crypter est vide
    
    case MdpVide // a lever si le mot de passe n'a pas été donnée'
    
    case MdpTropCourt(String)// le mot de passe est rop court
    
    case MdpTropLong(String)
}

func crypter(chaine: String, avecMotDePasse password: String) throws -> String{
    
    if !(chaine.characters.count > 0)
    {
        throw ErreursCryptage.ChaineVide
    }
    
    
    guard password.characters.count > 0
    else
    {
       throw ErreursCryptage.MdpVide
    }
    
    guard password.characters.count <= 6
        else
    {
        throw ErreursCryptage.MdpTropCourt("Le mot de passe est trop court")
    }
    
    guard password.characters.count <= 30
        else
    {
        throw ErreursCryptage.MdpTropLong("Le mot de passe est trop long")
    }
    //crypter la chaine 
    //dans note , on se limite à modifier la chaine on lui ajoute le password à gauche et à droite et on inverse les caractère
    
    let chaineCrypté = password + chaine + password
    
    return String(chaineCrypté.characters.reversed())
}

var chaineACrypter = "j'aime swift"
var mdp = "abc"
do{
try crypter(chaine: chaineACrypter, avecMotDePasse: mdp)
}catch ErreursCryptage.MdpVide
{
    print("Veillez donner la chaien a crypter")
}
catch ErreursCryptage.ChaineVide
{
    print("Veillez donner le mot de passe")
}
catch ErreursCryptage.MdpTropCourt(let msg)
{
    print(msg)
}
catch let erreur
{
    print("une erreur a été rencontré : \(erreur)" )
}

if let leResultat = try? crypter(chaine: chaineACrypter, avecMotDePasse: mdp)
{
    print("*** \(leResultat)")
}
else
{
    print("Le cryptage a échoué")
}

//on peut forcer le try si one sur de et certain de la validité des paramètres fournis
//certain que la fonction donnera un valeur exact

let msgCrypté = try! crypter(chaine: "autre chaine a crypter", avecMotDePasse: "abcdef")
