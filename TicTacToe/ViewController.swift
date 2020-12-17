//
//  ViewController.swift
//  TicTacToe
//
//  Created by Aneta Szmidt on 2020-12-15.
//

import UIKit

class ViewController: UIViewController  {
 

    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var playerLabel: UILabel!
    var player = 1
    var vinner: Bool = false
    let gameModel = GameModel()
    
    var gameState = ["0", "0", "0", "0", "0", "0", "0", "0", "0"]

    @IBOutlet weak var item0: UIImageView!
    @IBOutlet weak var item1: UIImageView!
    @IBOutlet weak var item2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vinner = false
        
        

    }

    func playAgain(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "gameView") as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func doMove(Img: UIImageView){
        
        let img = Img
        
        let position = img.restorationIdentifier
        let positionInt = Int(position!)
        
        
        switch player {
        case 1:
            img.image = UIImage(named: "circle")
            player = 2
            player2Label.textColor = UIColor.red
            playerLabel.textColor = UIColor.black

            gameState[positionInt!] = "O"
            vinner = gameModel.checkIfVinner(gameState: gameState)

            if vinner == true {
                playerLabel.text = "Win"
         //       self.view.isUserInteractionEnabled = false

                let alert = gameModel.showDialogVinner()
           present(alert, animated: true)

                self.reloadInputViews()

            }



        default:
            img.image = UIImage(named: "cross")
            player = 1
            playerLabel.textColor = UIColor.red
            player2Label.textColor = UIColor.black

            gameState[positionInt!] = "X"

            vinner = gameModel.checkIfVinner(gameState: gameState)
            
            if vinner == true {
                player2Label.text = "Win"
         //       self.view.isUserInteractionEnabled = false

                let alert = gameModel.showDialogVinner()
           present(alert, animated: true)
                self.reloadInputViews()
            }
        }
        img.isUserInteractionEnabled = false
        
        print(gameState)

     
 
    }

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
                
        let img = sender.view as! UIImageView


        doMove(Img: img)
        
    
}
}

