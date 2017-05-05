//: Playground - noun: a place where people can play

func go(_ person: String, from city:String = "Bxl", lovers: Int...)->String
{
    var cnt=0
    for l in lovers
    {
        cnt += l
    }
    return "hello "+person+""+String(cnt)
}

print(go("riko", from: "jersey", lovers: 1,2,3))

func f2()->(ok : String, ok2 : String)
{
    return ("Hello","hoh")
}

//in and out 

func inF(_ a: inout Int)
{
    a = 2
}

var a: Int = 0
    
inF(&a)

a

func add(_ a:Int,_ b:Int)-> Int
{
    return a+b
}

//save function
var myFunc : (Int,Int)->Int=add

myFunc(1,2)

func Ff2(b:Bool)->(Int)->Int
{
    func f1(a:Int)->Int{return a-1;}
    func f2(a:Int)->Int{return a+1;}
    return b ? f1 : f2;
}

//closure
Ff2(b:2<1)(2)

//var enclo : (Int,Int)->Int = {(i1:Int,i2:Int) in i1*i2}
//var enclo : (Int,Int)->Int = {(i1,i2) in i1*i2}
//var enclo : (Int,Int)->Int = {i1, i2 in return i1*i2}
var enclo : (Int,Int)->Int = {i1, i2 in i1*i2}
var enclo2 : (Int,Int)->Int = {$0*$1}


enclo(4,2)
enclo2(8,9)

func fClose(_ closure: (String,String)->Bool)->Bool
{
    var a="aaa", b = "bbb"
    return closure(a,b);
}

fClose(){$0>$1}
fClose{$0<$1}


// nested closure

func fnt(forIncrement fi:Int)->()->Int
{
    var av = 5
    func increment()->Int
    {
        av += 1;
        return av;
    }
    return increment
}

var incrementer = fnt(forIncrement : 5)
incrementer()
incrementer()
incrementer()


// escape when the function will be caleld later




var funcList=[()->Int]()
func addFuck(f2Add:@escaping ()->Int)
{
    
    funcList.append(f2Add)
}


addFuck(f2Add: {1})
addFuck(f2Add: {2})

for i in funcList
{
    i()
}
//récupérer la première closure dans la liste
funcList.first?()



//autoclosure :autoclosure lets you delay evaluation, because the code inside isn’t run until you call the closure. 

var autoClo = { print("hoho") }

//@autoclosure permet d'écrire l'autoclosure comme un string
//func autoCloFunc(auto:()->Void)
func autoCloFunc(auto:@autoclosure ()->Void)
{
    auto()
}

autoCloFunc(auto: print("hohoh"))



