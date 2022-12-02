//
//  ViewController.swift
//  myGame
//
//  Created by Digital on 28/11/2022.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var playerTwo: UIView!
    @IBOutlet weak var playerOne: UIView!
    @IBOutlet weak var ball: UIView!
    @IBOutlet weak var rightWall: UIView!
    @IBOutlet weak var leftWall: UIView!
    
    @IBOutlet weak var labelScorePlayerTwo: UILabel!
    @IBOutlet weak var labelScorePLayerOne: UILabel!
    @IBOutlet weak var goalPlayerTwo: UIView!
    @IBOutlet weak var goalPlayerOne: UIView!
    var multiplier = 3.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var dirX = 1.0*multiplier
        var dirY = -1.0*multiplier
        
        var scoreP1 = 0
        var scoreP2 = 0
        Timer.scheduledTimer(withTimeInterval: 1.0/30.0, repeats: true) { t in
            //Code executé 20x/sec
            self.ball.center.x += dirX
            self.ball.center.y += dirY
            self.labelScorePlayerTwo.text = "\(scoreP2)"
            self.labelScorePLayerOne.text = "\(scoreP1)"
        
            if(self.playerTwo.frame.contains(self.ball.center)){
                dirY = 1.0*self.multiplier
            }
            
            if(self.rightWall.frame.contains(self.ball.center)){
                dirX = -1.0*self.multiplier
            }
            
            if(self.leftWall.frame.contains(self.ball.center)){
                dirX = 1.0*self.multiplier
            }
            
            if(self.playerOne.frame.contains(self.ball.center)){
                dirY = -1.0*self.multiplier
            }
            
            if(self.goalPlayerOne.frame.contains(self.ball.center)){
                scoreP2 += 1
                self.resetBall()
            }
            
            if(self.goalPlayerTwo.frame.contains(self.ball.center)){
                scoreP1 += 1
                self.resetBall()
            }
        }
    }
    
    func resetBall(){
        self.ball.center = CGPoint(x:197, y:245)
    }
    
    
    @IBAction func rightClicked(_ sender: Any) {
        self.playerTwo.center.x += 1*multiplier
    }
    @IBAction func leftClicked(_ sender: Any) {
        self.playerTwo.center.x += -1*multiplier
    }
    
    @IBAction func playerOneLeftButton(_ sender: Any) {
        self.playerOne.center.x += -1*multiplier
    }
    @IBAction func playerOneRightButton(_ sender: Any) {
        self.playerOne.center.x += 1*multiplier
    }
    

}

