/**

                            Online Swift Compiler.
                Code, Compile, Run and Debug Swift script online.
Write your code in this editor and press "Run" button to execute it.

*/


// print("Hello World")

// var k:Int = 1
// var ko:Double = 2.4
// let m:Bool = true
// var oo = 11
// var strin:String = "kkk"

// print(k,ko,m,oo, strin)

// if oo==11{
//     print("ii")
// };


// var k1 = 1; var k2=2
// print(k1, k2)

// for i in 0..<4{
//     print(i)
// }

// func hell(x) {
//     x = x+1 
// // } 

// // hell(3)

// var pp:[Int]=[2,4,3]
// var ll:[Any]=[22,"k", 90]
// // pp.append(2)

// // print(pp)

// for item in ll {
//     print(item)
// }

//for i in 0...ll

// var diction:[String:String]=[:]
// diction["1"] = "iii"
// diction["2"] = "Uss"

//print(diction["2"])
//print(diction)

// for (value) in diction{
//     //print(key)
//     print(value)
// }

// var opti:Int?
// opti=1

// print(opti)



// func myfunc(part1:Int, part2:String) -> Bool
// {
//     return true
// }

// let result = myfunc(part1:1,part2:"nnn")
// print(result)
// = [ 1 : "abc", 2 : "cde"]
//HomeWork Class 1
var input:String = "945"
var diction2:[String:String]=[:]
diction2["9"] = "Nine"
diction2["4"] = "Four"
diction2["5"] = "Five"
var result:[String] = []; var result2:String=""
for i in input 
{
    let k = (diction2[String(i)])
    result.append(k!)
    result2 = result2 + " " + String(k!)
}
print(result, result2)




func convert(input2:String) -> String {
    var diction3:[String:String]=["1":"One", "2": "Two", "3":"Three","4":"Four",
    "5":"Five","6":"Six","7":"Seven", "8":"Eight", "9":"Nine", "0": "Zero"]
    var result3:String="";
    for i in input2 {
        let k = (diction3[String(i)])
        result3 = result3 + " " + String(k!) }
    return(result3)
}
print(convert(input2:"123"))
print(convert(input2:"0879"))






// let char: Character = "5"
// if let intValue = char.wholeNumberValue {
//     print("Value is \(intValue)")
// } else {
//     print("Not an integer")
// }


// let stringSent = "babbbababa"
// let charValues = ["a":1,"b":2]
// var total = 0

// for i in stringSent
// {
//     print(charValues[String(i)])
// q}









