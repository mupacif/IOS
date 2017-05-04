//: Playground - noun: a place where people can play


var someInts = [Int]()
someInts.append(3)
someInts = []

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

//on peut concatener 2 tableaux

//créer avec des litéral
var shoppingList: [String] = ["Eggs", "Milk"]
//var shoppingList = ["Eggs", "Milk"] type inférence
shoppingList += ["Baking Powder"]

shoppingList[0] = "Six eggs"

shoppingList[0...2] = ["Bananas", "Apples"]
shoppingList

shoppingList.insert("Maple Syrup", at: 0)

let apples = shoppingList.removeLast()

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

//sets 
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

favoriteGenres.contains("Funk")

letters.insert("z")
letters.insert("a")
for l in letters.sorted()
{
    print(l)
}

//opérations logiques

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]


let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true


//Dictionairies

var namesOfIntegers = [Int: String]()

namesOfIntegers[16] = "sixteen"
// namesOfIntegers now contains 1 key-value pair
namesOfIntegers = [:]
// namesOfIntegers is once again an empty dictionary of type [Int: String]
