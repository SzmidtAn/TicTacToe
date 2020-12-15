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
    
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    @IBOutlet weak var item0: UIImageView!
    @IBOutlet weak var item1: UIImageView!
    @IBOutlet weak var item2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vinner = false
        
        

    }

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
                
        var img = sender.view as! UIImageView

        let position = img.restorationIdentifier
        
        
        switch player {
        case 1:
            img.image = UIImage(named: "circle")
            player = 2
            player2Label.textColor = UIColor.red
            playerLabel.textColor = UIColor.black

            gameModel.listOfPlayersMoves.append(position!)
            gameModel.listOfPlayersMoves.sort()
            print(gameModel.listOfPlayersMoves)
           vinner =  gameModel.checkIfVinner(list: gameModel.listOfPlayersMoves)
            
            if vinner == true {
                playerLabel.text = "Win"
         //       self.view.isUserInteractionEnabled = false

                self.reloadInputViews()

            }



        default:
            img.image = UIImage(named: "cross")
            player = 1
            playerLabel.textColor = UIColor.red
            player2Label.textColor = UIColor.black
            gameModel.listOfPlayer2sMoves.append(position!)
            gameModel.listOfPlayer2sMoves.sort()
            print(gameModel.listOfPlayer2sMoves)
            vinner = gameModel.checkIfVinner(list: gameModel.listOfPlayer2sMoves)

            if vinner == true {
                player2Label.text = "Win"
         //       self.view.isUserInteractionEnabled = false

                self.reloadInputViews()
            }
        }
        img.isUserInteractionEnabled = false

     
 
    
}
}

