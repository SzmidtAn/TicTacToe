//
//  HomeViewController.swift
//  TicTacToe
//
//  Created by Aneta Szmidt on 2020-12-30.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var getPlayer1Name: UITextField!
    
    @IBOutlet weak var getPlayer2Name: UITextField!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let playController = segue.destination as! ViewController
        playController.playerName = getPlayer1Name.text!
        playController.player2Name = getPlayer2Name.text!
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
}
