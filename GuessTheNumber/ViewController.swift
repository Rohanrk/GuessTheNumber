//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Rohan Ramakrishnan on 9/6/16.
//  Copyright © 2016 Rohan Ramakrishnan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    
    let lowerBound = 1
    let upperBound = 100
    
    // Variables
    var numberToGuess : Int!
    var numberOfGuesses = 0
    
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100))
    }

    @IBAction func submitButtonPressed(sender: UIButton) {
        if let guess = guessTextField.text {
            if let guessInt = Int(guess) {
                numberOfGuesses = numberOfGuesses + 1
                validateGuess(guessInt)
            }
        }
    }
    
    func validateGuess(guess: Int) {
        if (guess < lowerBound || guess > upperBound) {
            showBoundsAlert()
        } else if (guess > numberToGuess) {
            showHigherAlert()
        } else if (guess < numberToGuess) {
            showLowerAlert()
        } else {
            showWinAlert()
            numberOfGuesses = 0
            generateRandomNumber()
        }
    }
    
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Hey!", message: "Your guess should be between 1 and 100!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Got it", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "You Win!", message: "You've guessed the correct number!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Collect Reward", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showLowerAlert() {
        let alert = UIAlertController(title: "Too low!", message: "Your number is too low. Try again!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Retry", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showHigherAlert() {
        let alert = UIAlertController(title: "Too high!", message: "Your number is too high. Try again!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Retry", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

