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


var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

favoriteGenres.contains("Funk")