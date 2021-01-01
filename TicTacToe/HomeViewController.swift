//
//  HomeViewController.swift
//  TicTacToe
//
//  Created by Aneta Szmidt on 2020-12-30.
//

import UIKit

class HomeViewController: UIViewController {
    
    var isComputerPlaying = false
    
    @IBOutlet weak var getPlayer1Name: UITextField!
    
    @IBOutlet weak var getPlayer2Name: UITextField!
    @IBAction func playWithComp(_ sender: Any) {
        isComputerPlaying = true
        self.performSegue(withIdentifier: "playGame", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let playController = segue.destination as! ViewController
        playController.computerIsPlaying = isComputerPlaying

        playController.playerName = getPlayer1Name.text!
        if isComputerPlaying{
            playController.player2Name = "Computer"
        }else{
            playController.player2Name = getPlayer2Name.text!
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
}
