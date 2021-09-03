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
                "Deceive heavens into trusting one does not cross the sea",
                "Besiege Wèi to rescue Zhào",
                "Kill with a borrowed knife",
                "Be prepared and wait for the exhausted enemy",
                "Loot a burning property",
                "Make a sound in the east, then strike in the west",
                "Create something from nothing",
                "Openly chisel a tunnel in the steep precipice, but clandestinely go through an easy path",
                "Watch fires burning on the other bank of the river",
                "Hide a knife within a smile",
                "Sacrifice the plum tree to preserve the peach tree",
                "Take the opportunity to pilfer a goat",
                "Stomp the grass to scare the snake",
                "Borrow a corpse to resurrect the soul",
                "Lure the tiger off its mountain lair",
                "In order to capture, one must let loose",
                "Tossing out a brick to get a jade gem",
                "Defeat the enemy by capturing their chief",
                "Remove the firewood from under the pot",
                "Disturb the water and catch a fish",
                "Slough off the cicada's golden shell",
                "Shut the door to catch the thief",
                "Befriend a distant state and strike a neighbouring one",
                "Obtain safe passage to conquer the State of Guo",
                "Replace the beams with rotten timbers",
                "Point at the mulberry tree while cursing the locust tree",
                "Feign madness but keep your balance",
                "Remove the ladder when the enemy has ascended to the roof",
                "Decorate the tree with false blossoms",
                "Make the host and the guest exchange roles",
                "The beauty trap",
                "The empty fort strategy",
                "Let the enemy's own spy sow discord in the enemy camp",
                "Inflict injury on oneself to win the enemy's trust",
                "Chain stratagems",
                "If all else fails, retreat",
                "If all else fails, retreat"
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
        label2.text = "Kế \(count+1)"
    }
    
    
    @IBOutlet weak var picture: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = " Oh My Lord 🥺"
        
        
    }


}

