//
//  TargetViewController.swift
//  Bull's Eye
//
//  Created by Dipesh Karki on 15/01/2015.
//  Copyright (c) 2015 Dipesh Karki. All rights reserved.
//

import UIKit

class TargetViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    
    var currentSliderValue : Int = 0
    var targetValue : Int = 0
    var score : Int = 0
    var round : Int = 0
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         startNextRound()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func hitButton(sender: UIButton) {
        
      // Displaying Alert message after tapping Hit Button
       
        var difference : Int = abs(currentSliderValue - targetValue)
        
        let points = 100 - difference
        score += points
        var title : String
        
        if difference == 0 {
            title = "Perfect Score !!"
        }
        
        else if difference < 10 {
            title = "You almost had it!!"
        }
        
        else {
            title = "You are not even close !!"
        }
        
        
        let message = "You have scored \(score)"
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Cancel, handler: { action in self.startNextRound()})
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
 
            }

    
    @IBAction func sliderMoved(slider: UISlider) {
        currentSliderValue = lroundf(slider.value)
    }
    
    @IBAction func startNextRound(){
        
        targetValue = 1 + Int(arc4random_uniform(100))
        currentSliderValue = lroundf(slider.value)
        round += 1
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNextRound()
    }
   
    @IBAction func reset(sender: UIButton) {
        
        startNewGame()
    }

}

