//
//  ViewController.swift
//  CodingMentor
//
//  Created by TommyFrancis on 3/9/21.
//

import UIKit

class ViewController: UIViewController {
    let fruits = ["🍏","🍎","🫐","🍓","🥥","🍅"]
    var count:Int = 0
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label2: UILabel!
    
    
    @IBAction func ButtonClick(_ sender: Any) {
        //let plains:String = ["1", "2"]
        let plans = [
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
        //print(" Button Click")
        count += 1
        if (count >= 36) {
            count = 0
        }
        //label.text = " Oh My Lord 🥺 \(count) !"
        //print(count)
        //label.text = " Oh My Lord 🥺 \(fruits[count])!"
        label.text = "\(plans[count])!"
        label2.text = "RS \(count+1)"
    }
    
    
    @IBOutlet weak var picture: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = " Click to Start 🥺"
        
        
    }


}

