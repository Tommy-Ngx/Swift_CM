import UIKit
var greeting = "Hello, CodingMentor playground "
print(greeting)

func convert(input2:String) -> String {
    let diction3:[String:String]=["1":"One", "2": "Two", "3":"Three","4":"Four","5":"Five","6":"Six" ,"7":"Seven", "8":"Eight","9":"Nine", "0": "Zero"]
    var result3:String="";
    for i in input2 {
        let k = (diction3[String(i)])
        result3 = result3 + " " + String(k!) }
    return(result3)
}
print(convert(input2:"123"))
print(convert(input2:"0879"))
