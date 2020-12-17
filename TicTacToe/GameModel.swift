//
//  GameController.swift
//  TicTacToe
//
//  Created by Aneta Szmidt on 2020-12-15.
//

import Foundation
import UIKit

class GameModel {
    

    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    

    func checkIfVinner(gameState: Array<String>) -> Bool{

        var vinner:Bool = false

        for combination in winningCombinations {

                    if gameState[combination[0]] != "0" && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
        
                        vinner = true
                        
                        
                    }
   
        }
        return vinner
    }
    

    func showDialogVinner() -> UIAlertController{
        let alert = UIAlertController(title: "Vinner!", message: "Player vinner", preferredStyle: .alert)
        let startSidaButton = UIAlertAction(title: "Go to menu" , style: .cancel)
        let continueGameButton = UIAlertAction(title: "Play again", style: .default){action in
            let view = ViewController()
            view.playAgain()
            
            
        }
        alert.addAction(startSidaButton)
        alert.addAction(continueGameButton)
        

        return alert
    }
    
}
