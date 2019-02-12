//
//  ViewController.swift
//  tick tack toe
//
//  Created by student on 2/7/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // Cross or x
    var gameStartup = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameInPlay = true
    
    let winningPossibilities = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func action(_ sender: AnyObject) {
      
        
        if (gameStartup[sender.tag-1] == 0 && gameInPlay == true){
            gameStartup[sender.tag-1] = activePlayer
            
            if (activePlayer == 1){
                sender.setImage(UIImage(named: " .png"), for: UIControl.State())
                activePlayer = 2
            }
            else {
                sender.setImage(UIImage(named: "o.png"), for: UIControl.State())
                activePlayer = 1
            }
        }
        for possibility in winningPossibilities {
            if gameStartup[possibility[0]] != 0 && gameStartup[possibility[0]] == gameStartup[possibility[1]] && gameStartup[possibility[1]] == gameStartup[possibility[2]] {
                gameInPlay = false
                
                if gameStartup[possibility[0]] == 1{
                    resultLabel.text = "X has won!"
                   
                }
                else{
                    resultLabel.text = "O has won!"
                    
                }
                playAgainButton.isHidden = false
                resultLabel.isHidden = false
                return
            }
        }
        gameInPlay = false
        for i in gameStartup{
            if i == 0{
                gameInPlay = true
                break
            }
        }
        if gameInPlay == false{
            resultLabel.text = "It was a draw!"
            resultLabel.isHidden = false
            playAgainButton.isHidden = false
         
        }
        
    }

    

    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: AnyObject) {
        gameStartup = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameInPlay = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        resultLabel.isHidden = true
        
        for i in 1...9 {
            let clickedButton = view.viewWithTag(i) as! UIButton
            clickedButton.setImage(nil, for: UIControl.State())
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }

}

