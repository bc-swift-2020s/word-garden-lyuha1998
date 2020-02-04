//
//  ViewController.swift
//  wordgarden
//
//  Created by Huiyi Victoria Lyu on 2/1/20.
//  Copyright © 2020 Huiyi Victoria Lyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var UserguessLabel: UILabel!
    
    
    @IBOutlet weak var guessLetterField: UITextField!
    
    
    @IBOutlet weak var guessletterbutton: UIButton!
    
    
    @IBOutlet weak var guesscountlabel: UILabel!
    
    
    @IBOutlet weak var playagainbotton: UIButton!
    
    
    @IBOutlet weak var image: UIImageView!
    
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guesscount  = 0
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        guessletterbutton.isEnabled = false
        playagainbotton.isHidden = false
        // Do any additional setup after loading the view.
        //when open playagain botton hidden and guess cannot be clicked 
    }
    
    
    func updateUIAfterGuess () {
        guessLetterField.resignFirstResponder()
        guessLetterField.text = " "
        //keyboard dismisses
        //clear the textbox out
    }
    
    @IBAction func Donekeypressed(_ sender: Any) {
          updateUIAfterGuess()
          guessALetter()
      }
    
    @IBAction func guessletterbottonpressed(_ sender: UIButton) {
        
        guessALetter()
        updateUIAfterGuess()
        
    }
    
    
    @ IBAction func Editchanged(_ sender: UITextField) {
             
             if let letterGuessed = guessLetterField.text?.last
             {  guessLetterField.text = "\(letterGuessed)"
                 guessletterbutton.isEnabled = true
                 
             } else
             {//disable the button if i dont have one single character
                 guessletterbutton.isEnabled = false
             }
             
             
         }
         
         
         
         
         
    @IBAction func playagainclicked(_ sender: Any) {
        
        
        playagainbotton.isHidden = true
        guessLetterField.isEnabled = true
        guessletterbutton.isEnabled =  false
        image.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = " "
        
        formatUserGuessLabel()
        
        guesscountlabel.text = "You have made 0 guesses"
        
        
        
        
    }
    
    func formatUserGuessLabel () {
        
        var revealedWord = " "
        lettersGuessed += guessLetterField.text!
        
        
        
        
        
        
        for letter in wordToGuess {
            if lettersGuessed.contains (letter) {
                revealedWord = revealedWord + "\(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        //start with a blank space, get rid of the first empty space to start the word
        UserguessLabel.text = revealedWord
        
    }
    
    
    func guessALetter () {
        
        formatUserGuessLabel ()
        guesscount += 1
        
        
        
        let currentLetterGuessed = guessLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed) {
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            image.image = UIImage(named: "flower\(wrongGuessesRemaining)")
            
        }
        let revealedWord = UserguessLabel.text!
        
        
        if wrongGuessesRemaining == 0 {
            guesscountlabel.text = "You have used all your attempts, sorry!"
            playagainbotton.isHidden = false
            guessLetterField.isEnabled = false
            guessletterbutton.isEnabled =  false
            
            
            
        } else if !revealedWord.contains("_")
        { playagainbotton.isHidden = false
            guessLetterField.isEnabled = false
            guessletterbutton.isEnabled =  false
            guesscountlabel.text = "You got it!"
            
            
            
        } else
        {//update our guess count
            
          //  if guesscount == 1 {
           //     guess = "guess"
            }
            //definition: if guesscount is 1, then guess is guess, not plural
            
            guesscountlabel.text = " You have made \(guesscount) attempts"
        }
        
        
        
        
        
        
        
        
     
        
        
  
        
    }
    
    //auto enable return key, return key disabled when nothing in the textfield

