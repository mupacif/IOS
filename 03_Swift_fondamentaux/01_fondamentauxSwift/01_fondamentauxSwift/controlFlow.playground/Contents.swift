//: Playground - noun: a place where people can play

for i in stride(from: 0, to: 10, by: 2)
{
print(i)
}

var ok = [Int](repeating:3,count:5)

//switch

let age = 5

switch age {
case 0..<10:
    print("petit")
case 10..<30:
    print("jeune")
case 30..<99:
    print("vieux")
default:
    print("imortel")
}

let somePoint = (6, 0)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
//case (_, 0):
  //  print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
case (let dist, 0),(0, let dist):
    print("Passe par l'origine à une distance \(dist)")
case let(x,y) where x == 2*y:
    print("magic in the sky")
case let(x,y):
    print("\(x) is outside of the box")
}

//guard
func ok(tab:[String:String])
{
    guard let name = tab["nom"] else {
        print("i hope you have a name")
        return
    }
    
    print("Bonjour \(name)")
}
ok(tab:["nom":"koko"])


