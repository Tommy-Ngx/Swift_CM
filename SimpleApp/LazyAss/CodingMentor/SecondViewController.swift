//
//  SecondViewController.swift
//  SecondViewController
//
//  Created by TommyFrancis on 10/9/21.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var download: UIImageView!
    @IBOutlet weak var speed: UISegmentedControl!
    @IBOutlet weak var aus: UISwitch!
    @IBOutlet weak var bri: UISwitch!
    @IBOutlet weak var go: UIButton!
    @IBOutlet weak var updateQuestionBank: UIButton!
    
    
    @IBAction func AusSwitch(_ sender: Any) {
        bri.setOn(false, animated: true);
        aus.setOn(true, animated: true);
        NotificationCenter.default.post(name:Notification.Name("accent"),object: "en-AU")
        print("Updating Accent Aussie")
    }
    @IBAction func BriSwitch(_ sender: Any) {
        aus.setOn(false, animated: true);
        bri.setOn(true, animated: true);
        NotificationCenter.default.post(name:Notification.Name("accent"),object: "en-GB")
        print("Updating Accent Bristish")
    }
    
    var updatespeed: Float = 0.5
    @IBAction func SpeedUpdate(_ sender: Any) {
        if (speed.selectedSegmentIndex == 0) {
            updatespeed = 0.28
        } else {
            if (speed.selectedSegmentIndex == 1) {
                updatespeed = 0.5
            }else {
                updatespeed = 0.6
            }
        }
        NotificationCenter.default.post(name:Notification.Name("speed"),object: updatespeed)
        print("Notification Speed: \(updatespeed)")
    }
    
    var updateQB: String = ""
    @IBAction func DownloadQuestion(_ sender: Any) {
        download.loadGif(name: "ok")
        updateQuestionBank.isEnabled = false
        //self.DownloadQuestion.stringValue = "Download Completed LOL :D"
        let url = URL(string: "https://raw.githubusercontent.com/Tommy-Ngx/Swift_CM/main/SimpleApp/LazyAss/repeatsentence.txt")
        FileDownloader.loadFileAsync(url: url!) { (path, error) in  print("PDF File downloaded to : \(path!)")}
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            // your code here
            var updateQB:[String] = []
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            do {
                let fileUrls = try FileManager.default.contentsOfDirectory(at: path!, includingPropertiesForKeys: nil)
                //print(fileUrls)
                //Read the text
                let textContent = try String(contentsOf: fileUrls[0], encoding:.utf8)
                //print(textContent)
                updateQB = textContent.components(separatedBy:",\n")
                print(updateQB)
                print("New total new arrays: \(updateQB.count)")
                NotificationCenter.default.post(name:Notification.Name("QB"),object: updateQB)
                print("Notification QuestionBank: \(updateQB.count)")
                //self.checkdata2 = 30
            } catch {print ("ERROR")}
        }
    }
    

    
        
    @IBAction func buttonGo(_ sender: Any) {
        download.loadGif(name: "setting")
        self.dismiss(animated: true, completion: nil)
        
        //NotificationCenter.default.post(name:Notification.Name("speed"),object: Float(updatespeed))
        
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let checkdata2 = ViewController.checkdata
        //var getThatValue = myCustomViewController.someVariable
        if checkdata2 == 30{
                download.loadGif(name: "download")
        } else {
            download.loadGif(name: "setting")
            updateQuestionBank.isEnabled = false
            
        }
        bri.setOn(false, animated: true);
        if ViewController.updateAccent2 == "en-GB" {
            bri.setOn(true, animated: true);
            aus.setOn(false, animated: true);
        }
        //bri.updateUserActivityState()
        // Do any additional setup after loading the view.
        go.applyDesign3()
        speed.selectedSegmentIndex = 1
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    

}

extension UIButton {
    func applyDesign3() {
        self.layer.shadowColor = UIColor.systemBlue.cgColor
        //self.layer.m = UIColor.white.cgColor
        //self.layer.bounds = 2
        //self.layer.borderWidth = 2
        //sleep(UInt32(1.0))
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 50
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.shadowRadius = 25
        self.layer.shadowOpacity = 0.9
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
    }
}

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
