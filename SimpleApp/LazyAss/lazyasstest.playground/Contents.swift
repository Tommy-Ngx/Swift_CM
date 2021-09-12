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
//class Human {
//    var hairColor:String = "black"
//    func eat() {
//        print("Eat")
//    }
//}
//
//let obj = Human()
//obj.hairColor = "Blue"
//
//print(obj.hairColor)
//obj.eat()


////https://raw.githubusercontent.com/Tommy-Ngx/Swift_CM/main/SimpleApp/LazyAss/repeatsentence.txt
import Foundation

class FileDownloader {

    static func loadFileSync(url: URL, completion: @escaping (String?, Error?) -> Void)
    {
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

        let destinationUrl = documentsUrl.appendingPathComponent(url.lastPathComponent)

        if FileManager().fileExists(atPath: destinationUrl.path)
        {
            print("File already exists [\(destinationUrl.path)]")
            completion(destinationUrl.path, nil)
        }
        else if let dataFromURL = NSData(contentsOf: url)
        {
            if dataFromURL.write(to: destinationUrl, atomically: true)
            {
                print("file saved [\(destinationUrl.path)]")
                completion(destinationUrl.path, nil)
            }
            else
            {
                print("error saving file")
                let error = NSError(domain:"Error saving file", code:1001, userInfo:nil)
                completion(destinationUrl.path, error)
            }
        }
        else
        {
            let error = NSError(domain:"Error downloading file", code:1002, userInfo:nil)
            completion(destinationUrl.path, error)
        }
    }

    static func loadFileAsync(url: URL, completion: @escaping (String?, Error?) -> Void)
    {
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

        let destinationUrl = documentsUrl.appendingPathComponent(url.lastPathComponent)

        if FileManager().fileExists(atPath: destinationUrl.path)
        {
            print("File already exists [\(destinationUrl.path)]")
            completion(destinationUrl.path, nil)
        }
        else
        {
            let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let task = session.dataTask(with: request, completionHandler:
            {
                data, response, error in
                if error == nil
                {
                    if let response = response as? HTTPURLResponse
                    {
                        if response.statusCode == 200
                        {
                            if let data = data
                            {
                                if let _ = try? data.write(to: destinationUrl, options: Data.WritingOptions.atomic)
                                {
                                    completion(destinationUrl.path, error)
                                }
                                else
                                {
                                    completion(destinationUrl.path, error)
                                }
                            }
                            else
                            {
                                completion(destinationUrl.path, error)
                            }
                        }
                    }
                }
                else
                {
                    completion(destinationUrl.path, error)
                }
            })
            task.resume()
        }
    }
}


let url = URL(string: "https://raw.githubusercontent.com/Tommy-Ngx/Swift_CM/main/SimpleApp/LazyAss/repeatsentence.txt")
FileDownloader.loadFileAsync(url: url!) { (path, error) in    print("PDF File downloaded to : \(path!)")}
//print( " Hello \(path)")

DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
    // your code here
    var updateQB:[String] = []
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    do {
        let fileUrls = try FileManager.default.contentsOfDirectory(at: path!, includingPropertiesForKeys: nil)
        print(fileUrls)
        //Read the text
        let textContent = try String(contentsOf: fileUrls[0], encoding:.utf8)
        //print(textContent)
        updateQB = textContent.components(separatedBy:",\n")
        print(updateQB)
        print("hello \(updateQB.count)")
    
    } catch {print ("ERROR")}
}


//NSString *filePath = [[NSBundle mainBundle] pathForResource:@"dictionary" ofType:@"txt"];
//FILE *dic = fopen([filePath cStringUsingEncoding: NSUTF8StringEncoding], "r");

//let path2 = "/Users/MacBookPro/Library/Developer/XCPGDevices/C1744FFC-1F95-40A8-A8AC-7ABD2D7309E5/data/Containers/Data/Application/A6846402-9F70-4B7D-BCD4-8A224E3D18DD/Documents/repeatsentence.txt"
//let str = ""
//let filename = getDocumentsDirectory().appendingPathComponent(path2)
//do {
//    try str?.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
//    print(str)
//}catch {
//    print("Something Went Wrong")
//}
//let url2:String =  "https://raw.githubusercontent.com/Tommy-Ngx/Swift_CM/main/SimpleApp/LazyAss/repeatsentence.txt"
//let richText = try NSAttributedString(url: url2, options: [:], documentAttributes: nil)
//let plainText = richText.string
//print(plainText)

//override func viewDidLoad() {
//    super.viewDidLoad()
    // Do any additional setup after loauing the view.
//let url = URL(string: "https://raw.githubusercontent.com/Tommy-Ngx/Swift_CM/main/SimpleApp/LazyAss/repeatsentence.txt")
////let url:String =  "https://raw.githubusercontent.com/Tommy-Ngx/Swift_CM/main/SimpleApp/LazyAss/repeatsentence.txt"
//let task = URLSession.shared.downloadTask(with: url!) { (urlresponse, response, error) in
//    guard let orginalUrl = urlresponse else {return}
//    do {
//        //get path to directory
//        let path = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//        //Giving name to file
//        let newUrl = path.appendingPathComponent("myTextFile") //Move file from old to new url
//        print(newUrl)
//        try
//            FileManager.default.moveItem(at: orginalUrl, to: newUrl)
//    }   catch {print(error.localizedDescription); return}
////}
//task.resume()
//READING AND WRITING
//var updateQB:[String] = []
//let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
//do {
//    let fileUrls = try FileManager.default.contentsOfDirectory(at: path!, includingPropertiesForKeys: nil)
//    print(fileUrls)
//    //Read the text
//    let textContent = try String(contentsOf: fileUrls[0], encoding:.utf8)
//    //print(textContent)
//    updateQB = textContent.components(separatedBy:",\n")
//    print(updateQB)
//    print("hello \(updateQB.count)")
//
//} catch {print ("ERROR")}



