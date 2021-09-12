//
//  ViewController.swift
//  CodingMentor
//
//  Created by TommyFrancis on 3/9/21.
//

import UIKit
import AVFoundation

//extension UIButton {
//    open override func draw(_ rect: CGRect) {
//        //provide custom style
//        self.layer.cornerRadius = 24
//        self.layer.masksToBounds = true
//       // self.layer.shadowColor =
//
//    }
//}

class ViewController: UIViewController {
    
    var count:Int = 0
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var buton2: UIButton!
    @IBOutlet weak var gifView: UIImageView!
    @IBOutlet weak var pic1: UIImageView!
    @IBOutlet weak var pic2: UIImageView!
    @IBOutlet weak var backbut: UIButton!
    
    static var checkdata:Int = 30

//    struct GlobalVariable{
//        static var checkdata = 30
//    }
    
    // self.layer.sha
    var plans = [
        "Usually but not always reviews provide an unbiased source of information.",
        "Farmers is Asia will need to produce more rice in order to feed the increasing population.",
        "We would use his brushes in new and interesting ways.",
        "In the art galleries main hall there is a nice sculpture carved from stone.",
        "Advertisements are all around us wherever we go whatever we do.",
        "Robotics is the science of developing robots.",
        "Robots are common in industry.",
        "Generally consumers, trust friends more than commercial information such as advertisement.",
        "A bucket list is a list of things you need to do before you die.",
        "An American man wakes up in a motel in California and speaking Swedish.",
        "As a student union member, we can influence the change of the university.",
        "At the beginning of each game, he kneels on one knee during the singing of Athen.",
        "Color bacteria thrive in warm water where the sanitation is poor.",
        "Egyptians were active some like a recipe for a healthy heart.",
        "Exam results will be available next week on the course website.",
        "Healthy children noticed that fearful face than any other emotions.",
        "Her knowledge of the forest is what he saved her life.",
        "I don't understand that what the comment of my essay means.",
        "I said I speak English and he speaks English we are not Spanish based people.",
        "If she doesn't speak the language, she will not sit around and wait for a translator.",
        "In the dark before dawn are assembled.",
        "It is now acknowledged that his work is groundbreaking.",
        "It was at this point that she went being the hunter to be hunted.",
        "It's never too early to start doing things you have always wanted to do.",
        "My mission is to help people be happier and healthier.",
        "Once I received abstract shapes and the others received an image of the face.",
        "One creates individual in Japan has made a similar protest for decades.",
        "One study asks people to keep daily journals recording their appreciation for their partners.",
        "Process and intensification provides a key competitive advantage in the market.",
        "Since the problems we face are global, we need to find global solutions.",
        "Some customers were looking for a place to hide their money for their home countries.",
        "Students are competing for every place in the computer courses.",
        "Students are instructed to hand in their assignments by the end of this week.",
        "That program depends entirely on private funding."
        ]
    

    
    
    @IBAction func ButtonClick(_ sender: Any) {
        //let plains:String = ["1", "2"]
        //print(" Button Click")
        //sleep(UInt32(5.0))
        count += 1
        if (count >= plans.count) {
            count = 0
        }
        button.isEnabled = false
        buton2.isEnabled = false
        label.text = "\(plans[count])!"
        label2.text = "RS   \(count+1)"
        buton2.layer.shadowColor = UIColor.systemPink.cgColor
        button.layer.shadowColor = UIColor.blue.cgColor
        gifView.isHidden = false
        self.label.alpha=0
        self.label.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        UIView.animate(withDuration: 0.4, delay: 0, animations: {
            self.label.alpha = 1.0
            self.label.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
        //let k:String
        //k = speak(sentence: plans[count])
        //if k == "OK" {
        //    gifView.isHidden = true}
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            // your code here
            self.speak(sentence: self.plans[self.count],speed: self.updateSpeed, accent: self.updateAccent)
            //self.gifView.isHidden = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            // your code here
            self.gifView.isHidden = true
            self.button.isEnabled = true
            self.buton2.isEnabled = true
            self.buton2.applyDesign()
            self.button.applyDesign()
        }
    }
    
    
    
    @IBAction func replay(_ sender: Any) {
        button.isEnabled = false
        buton2.isEnabled = false
        label.text = "\(plans[count])!"
        label2.text = "RS   \(count+1)"
        //button.layer.shadowColor = UIColor.systemOrange.cgColor
        //buton2.layer.shadowColor = UIColor.blue.cgColor
        buton2.applyDesign4()
        button.applyDesign4()
        gifView.isHidden = false
        //let k:String
        //if k == "OK" {
        //    gifView.isHidden = true}
        self.label.alpha=0
        self.label.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        UIView.animate(withDuration: 0.4, delay: 0, animations: {
            self.label.alpha = 1.0
            self.label.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            // your code here
            self.speak(sentence: self.plans[self.count],speed: self.updateSpeed, accent: self.updateAccent)
            //self.gifView.isHidden = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            // your code here
            self.gifView.isHidden = true
            self.button.isEnabled = true
            self.buton2.isEnabled = true
            self.buton2.applyDesign()
            self.button.applyDesign()
        }
    }
    
   
    
    //@IBOutlet weak var gifview2: UIImageView!
    @IBOutlet weak var slider: UISlider!
    @IBAction func slide(_ sender: Any) {
        
        let Value = slider.value
        let currentValue = Int(Float(plans.count-1)*Value)
        label.text = "\(plans[currentValue])!"
        label2.text = "RS   \(currentValue+1)"
        print("Slider changing to \(currentValue) ?")
        count = currentValue
        gifView.isHidden = true

    }
    @IBOutlet weak var picture: UIImageView!
    
    
    func speak(sentence:String, speed:Float, accent:String){
        let utterance = AVSpeechUtterance(string:sentence)
        utterance.voice = AVSpeechSynthesisVoice(language: accent)
        utterance.rate = speed //0.5

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        //return true
    }
    
  
    @IBAction func back(_ sender: Any) {
        //self.dismiss(animated: true, completion: nil)
        if plans.count > 100 {
            ViewController.checkdata = 100
        }
        if updateAccent == "en-GB" {
            ViewController.updateAccent2 = "en-GB"
        } else {
            ViewController.updateAccent2 = "en-AU"
        }
    }
    
    //var speed = Float()
    
    var updateSpeed:Float = 0.5
    var updateAccent:String = "en-AU"
    static var updateAccent2:String = "en-AU"
    @objc func didGetNotification(_ notification:Notification) {
        let speed = notification.object as! Float?
        updateSpeed = Float(speed!)
        print("Updating speed = \(updateSpeed)")
    }
    @objc func didGetNotification2(_ notification:Notification) {
        let accent = notification.object as! String?
        updateAccent = String(accent!)
        print("Updating Accent = \(updateAccent)")
    }
    @objc func didGetNotification3(_ notification:Notification) {
        let QB = notification.object as! [String]?
        //var updateQB:[String] = []
        plans = QB!
        print("Updating Data = \(plans.count)")
    }
    //var observer: NSObjectProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("speed"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification2(_:)), name: Notification.Name("accent"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification3(_:)), name: Notification.Name("QB"), object: nil)
        
        let generatedNumber = Int.random(in: 0...30)
        // Do any additional setup after loading the view.
        label.text = " Click to Start 🥺"
        count = generatedNumber
        button.applyDesign()
        buton2.applyDesign()
        //Thread.sleep(forTimeInterval: 2.0)
        gifView.isHidden = true
        gifView.loadGif(name: "siri")
        backbut.applyDesign2()
        //sleep(UInt32(5.0))
        //updateSpeed = speed
        
        
        
//        observer = NotificationCenter.default.addObserver(forName: "speed", object: nil, queue: .main, using: {
//            Notification in
//            guard let object = notification.object as? Float else {
//                return
//            }
//            self.
//            )
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension UIButton {
    func applyDesign() {
        self.layer.shadowColor = UIColor.blue.cgColor
        //self.layer.m = UIColor.white.cgColor
        //self.layer.bounds = 2
        //self.layer.borderWidth = 2
        //sleep(UInt32(1.0))
        self.layer.shadowRadius = 15
        self.layer.shadowOpacity = 0.4
        self.layer.cornerRadius = 35
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
    }
    func applyDesign2() {
        self.layer.shadowColor = UIColor.systemBlue.cgColor
        //self.layer.m = UIColor.white.cgColor
        //self.layer.bounds = 2
        //self.layer.borderWidth = 2
        //sleep(UInt32(1.0))
        self.layer.shadowRadius = 35
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 50
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
    }
    func applyDesign4() {
        self.layer.shadowColor = UIColor.white.cgColor
        //self.layer.m = UIColor.white.cgColor
        //self.layer.bounds = 2
        //self.layer.borderWidth = 2
        //sleep(UInt32(1.0))
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowRadius = 35
        //self.layer.borderWidth = 3
        //self.layer.cornerRadius = 50
        //self.layer.borderColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
    }
}
