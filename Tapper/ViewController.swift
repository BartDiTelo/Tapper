//
//  ViewController.swift
//  Tapper
//
//  Created by Bartłomiej Dietl on 08/11/15.
//  Copyright © 2015 Bartłomiej Dietl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Variables
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    
    //Outlets
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var howManyTaps: UITextField!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapCouter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapButtonPressed(sender: UIButton!){
        currentTaps++
        updateTapCouter()
        
        if isGameOver() {
            restartGame()
        }
        
    }
    
    @IBAction func onPlayButtonPressed(sender: UIButton!){
        
        if howManyTaps.text != nil && howManyTaps.text != "" {
            logoImageView.hidden = true
            startButton.hidden = true
            howManyTaps.hidden = true
            
            tapButton.hidden = false
            tapCouter.hidden = false
            
            maxTaps = Int(howManyTaps.text!)!
            currentTaps = 0
            
            updateTapCouter()
            
        }
    }
    func updateTapCouter() {
        tapCouter.text = "\(currentTaps) Taps"
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    func restartGame() {
            maxTaps = 0
            howManyTaps.text = ""
            logoImageView.hidden = false
            startButton.hidden = false
            howManyTaps.hidden = false
            
            tapButton.hidden = true
            tapCouter.hidden = true
        }

}

