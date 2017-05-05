//: Playground - noun: a place where people can play

struct Rectangle //héritaga, initalisateur
{
       var largeur:Int = 0
    var longeur:Int = 0{
        willSet
        {
            print("longeur avant changé")
        }
        didSet
        {
            print("longeur après changé")
        }
    }
}
class maForme
{
    var rec2Set = false

    let rectangle = Rectangle(largeur:500,longeur:4000)
    var rectangle2 = Rectangle(largeur:500,longeur:4000){
        didSet{
            self.rec2Set = true
        }
    }
    static var staticVar=0
    class func staticIncrement()
    {
        staticVar+=1
    }
    subscript(idx:Int)->Int
    {
       
        return idx==5 ?10:idx;
    }
    var description : String{
        	return "ma forme!"
    }
    func hoola() {
        print("HOORAY") 
    }
}

class maSuperForm : maForme
{
    override func hoola() {
        print("bongaa")
    }
    
    override var description: String{
        return "susu"
    }
}

var maforme = maForme()

var rec2 = maforme.rectangle
rec2.largeur = 1000 // la largeur peut changer car il y a copie de la structure
rec2


let maforme2 = maforme  // references or not 





maforme2.rectangle2.largeur = 400

maforme2.rectangle2.largeur // copry par référence
maforme.rectangle2.largeur

maforme2[4]

maforme2.hoola()

var classe2 = maSuperForm()

classe2.hoola()