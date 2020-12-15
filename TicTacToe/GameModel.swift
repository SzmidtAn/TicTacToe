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

    
    
}
