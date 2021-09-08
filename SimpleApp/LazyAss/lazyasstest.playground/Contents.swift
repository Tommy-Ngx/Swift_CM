import UIKit

var greeting = "Hello, playground"

//// Cách giai bài 1
//func convertFunc (myInt: Int) {
//    let myString = String(myInt)
//    let digits = myString.compactMap{ $0.wholeNumberValue }
//    print(digits)
//
//    for item in digits {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = NumberFormatter.Style.spellOut
//        let item = formatter.string(for:item)!
//        print(item)
//    }
//}
//
//convertFunc(myInt: 42)

//// Cách giai bài 1
//et myInt: Int = 97
//guard let myUnicodeScalar = UnicodeScalar(myInt) else {
//    return
//}
//let myCharv = Character(myUnicodeScalar)
//print(myChar)

//var myStr = "945"
//let myNumber = ["0","1","2","3","4","5","6","7","8","9"]
//let myString = ["Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine"]
//
//var returnArray:String=""
//for ch in myStr {
//    for i in 0..<myNumber.count{
//        if(String(ch) == myNumber[i]) {
//            returnArray.append(myString[i])
//            break
//        }
//    }
//}
//print(returnArray)

//"0" -> 0
//let myInt: Int = 65
//if let myUnicodeScalar = UnicodeScalar(myInt)
//{
//    return
//}
//let myChar = Character(myUnicodeScalar)
//print(myChar)

//var input = "124"
//for ch in input {
//    print("\(ch)")
//
//}

//var result = input.reduce("", {result, currentElement in result + dictionary[currentElement]! + " "})

// Buổi 2
class Human {
    var hairColor:String = "black"
    func eat() {
        print("Eat")
    }
}

let obj = Human()
obj.hairColor = "Blue"

print(obj.hairColor)
obj.eat()
