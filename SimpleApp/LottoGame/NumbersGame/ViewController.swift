//
//  Đánh Đề Cho vui
//  Vui là chánh!
//
//  Created by Tommy Ngx by Tihomir RAdeff Instructions!
//  Copyright © 2021 CODING MENTOR
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var currentNumber = 50
    var generatedNumber = 0
    
    //score
    var moves = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //button design - rounded corners
        upButton.layer.cornerRadius = 10
        downButton.layer.cornerRadius = 10
        checkButton.layer.cornerRadius = 10
        
        //set label to current number
        numberLabel.text = "\(currentNumber)"
        
        //generate number for guessing between 0 and 50
        generatedNumber = Int.random(in: 0...99)
    }

    @IBAction func upButtonAction(_ sender: Any) {
        //increase the currentNumber + 1
        currentNumber = currentNumber + 1
        
        //if higher than 50 make it 50
        if currentNumber > 99 {
            currentNumber = 99
        }
        
        //set label to current number
        numberLabel.text = "\(currentNumber)"
    }
    
    @IBAction func downButtonAction(_ sender: Any) {
        //decrease the currentNumber - 1
        currentNumber = currentNumber - 1
        
        //if lower than 0 make it 0
        if currentNumber < 0 {
            currentNumber = 0
        }
        
        //set label to current number
        numberLabel.text = "\(currentNumber)"
    }
    
    @IBAction func checkButtonAction(_ sender: Any) {
        //check if higher or lower
        if currentNumber > generatedNumber {
            statusLabel.text = "Bớt Xuống Đê!"
            
            //increase moves
            moves = moves + 1
        } else if currentNumber < generatedNumber {
            statusLabel.text = "Thêm Hơn Đê!"
            
            //increase moves
            moves = moves + 1
        } else {
            statusLabel.text = "Trúng Đề sau \(moves) lần xổ!"
            
            //disable the check button
            checkButton.isUserInteractionEnabled = false
        }
        
        //make animation to the status label
        UIView.transition(with: statusLabel, duration: 0.3, options: .transitionFlipFromBottom, animations: nil, completion: nil)
    }
}

