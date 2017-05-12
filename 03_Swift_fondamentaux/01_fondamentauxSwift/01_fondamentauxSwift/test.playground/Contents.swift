//: Playground - noun: a place where people can play


let i=1
assert(i>0,"hoho")

//tuples
var (a,b) = (1,2)

//condition multiple
(2,4,6)<(2,4,8)

// Ternaire

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName

//range opérator
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
//Half-Open Range Operator

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

//String
for character in "Dog!🐶".characters {
    print(character)
}

// concaténation string
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

// + += let exclamationMark: Character = "!"
//welcome.append(exclamationMark)

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

//-*******************
for index in greeting.characters.indices {
    print("\(greeting[index]) ")
}

//
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"

welcome.insert(contentsOf: " there".characters, at: welcome.index(before: welcome.endIndex))

welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)

//-***** méthode de classe String
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")


func insertion(tab:[Int],op:(Int,Int)->Bool={$0>$1})
{
    var tmpTab = tab
    var i = 0
    for j in 1..<tmpTab.count
    {
        var key = tmpTab[j]
        i=j-1
        while i > -1 && op(tmpTab[i],key)
        {
            tmpTab[i+1]=tmpTab[i]
            i=i-1
        }
        tmpTab[i+1]=key
        
    }
    print(tmpTab)
}
insertion(tab: [50,5,3,4]){$0<$1}