//
//  ViewController.swift
//  TicTacToe
//
//  Created by Aneta Szmidt on 2020-12-15.
//

import UIKit

class ViewController: UIViewController  {
 
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var playerLabel: UILabel!
    var player = 1
    var vinner: Bool = false
    let gameModel = GameModel()
    
    var gameState = ["0", "0", "0", "0", "0", "0", "0", "0", "0"]
    var pointsPlayer1 = 0
    var pointsPlayer2 = 0
    var numberOfMoves = 0
    var playerName = "Player 1"
    var player2Name = "Player 2"

    @IBOutlet var iv: [UIImageView]!
    @IBOutlet weak var item0: UIImageView!
    @IBOutlet weak var item1: UIImageView!
    @IBOutlet weak var item2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vinner = false
        playerLabel.textColor = UIColor.red
        playerLabel.text = playerName
        player2Label.text = player2Name
        
        if playerName == ""{
            playerLabel.text = "Player 1"
        }
        if player2Name == ""{
            player2Label.text = "Player 2"
        }
    }
    
    
    

    

    func doMove(Img: UIImageView){
        

        
        
        let img = Img
        
        let position = img.restorationIdentifier
        let positionInt = Int(position!)
        img.isUserInteractionEnabled = false

        
        
        switch player {
        case 1:
            img.image = UIImage(named: "circ")
            player = 2
            player2Label.textColor = UIColor.red
            playerLabel.textColor = UIColor.black

            gameState[positionInt!] = "O"

            vinner = gameModel.checkIfVinner(gameState: gameState)

            if vinner == true {

                pointsPlayer1 += 1
              showDialogVinner(player: playerName)
        
            }
        default:
            img.image = UIImage(named: "ccc")
            player = 1
            playerLabel.textColor = UIColor.red
            player2Label.textColor = UIColor.black

            gameState[positionInt!] = "X"

            vinner = gameModel.checkIfVinner(gameState: gameState)
            
            if vinner == true {

                pointsPlayer2 += 1
                
            showDialogVinner(player: player2Name)
            }
        }
        

        if numberOfMoves == 8 && vinner == false{
            showDialogVinner(player: "Nobody")
        }else{
            numberOfMoves += 1
        
     
 
    }
    }

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
                
        let img = sender.view as! UIImageView


        doMove(Img: img)
        
    
}
    

    
    func startNewGame(){
        
        
        pointsLabel?.text = String(String(pointsPlayer1) + " : " + String(pointsPlayer2))
        player = 1
        numberOfMoves = 0
        playerLabel?.textColor = UIColor.red
        player2Label?.textColor = UIColor.black

        for i in iv{
            i.image = nil
            i.isUserInteractionEnabled = true
            
        }
        
        for i in 0...gameState.count-1{
            gameState[i] = "0"
        }

    }
    
    
    
    func showDialogVinner(player: String){
        let alert = UIAlertController(title: "Victory!", message: player + " won", preferredStyle: .alert)
        let startSidaButton = UIAlertAction(title: "Go to menu" , style: .cancel){_ in
            
            self.performSegue(withIdentifier: "goHome", sender: self)
            
        }
        let continueGameButton = UIAlertAction(title: "Play again", style: .default){ [self]action in


            self.startNewGame()
        
            
        }
        alert.addAction(startSidaButton)
        alert.addAction(continueGameButton)
        

        present(alert, animated: true )
    }
    
}

