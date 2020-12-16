//
//  GameController.swift
//  TicTacToe
//
//  Created by Aneta Szmidt on 2020-12-15.
//

import Foundation
import UIKit

class GameModel {
    
    var listOfPlayersMoves: Array<String> = []
    var listOfPlayer2sMoves: Array<String> = []
    let winningCombination: Array<String> = ["012", "345"]


    func checkIfVinner(list: Array<String>) -> Bool{

        var vinner:Bool = true
        
        if list.count < 4 {
            
            switch list {
            case ["0", "1", "2"]:
                print("win")
            case  ["0", "3", "6"]:
                print("win")
            case  ["0", "4", "8"]:
                print("win")
            case  ["1", "4", "7"] :
                print("win")
            case  ["2", "5", "8"] :
                print("win")
            case["3", "4", "5"]:
                print("win")

            default: 
                 vinner = false

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
