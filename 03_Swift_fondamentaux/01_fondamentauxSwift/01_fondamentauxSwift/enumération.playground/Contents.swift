//: Playground - noun: a place where people can play


enum lane {
    case top(String)
    case bot
}

var go : lane
go = .top("hoho")

// énumération nommé
switch go
{
case .top(let name):
    print("\(name)")
default:
    break;
}

// enumération typé
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

var ACC = ASCIIControlCharacter.tab
ACC

// récupération du nom
enum CompassPoint: String {
    case north, south, east, west
}

CompassPoint.south.rawValue

// nommer les case
CompassPoint(rawValue: "south")

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

Planet(rawValue: 2)


