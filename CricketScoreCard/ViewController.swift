//
//  ViewController.swift
//  CricketScoreCard
//
//  Created by Hassan Sohail Dar on 24/8/2022.
//

import UIKit


class ViewController: UIViewController {
    static let nameOfPlayers = ["Mathew Hayden", "Adam Gilchrist", "Ricky Ponting", "Brian Lara", "Sachin Tendulkar" , "Kumar Sangakara", "Wasim Akram", "Waqar Younis", "Shane Warne", "Mutiah Muralitharan", "Jacques Kallis", "Brandon McCullum"]
    var player1Score: UILabel!
    var player2Score: UILabel!
    var totalScore: UILabel!
    var targetScore: UILabel!
    var winCalculator: UITextView!

    var scoreButtons = [UIButton]()
    var playerNames = [UIButton]()
    
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemGray
        
        player1Score = UILabel()
        player1Score.translatesAutoresizingMaskIntoConstraints = false
        player1Score.textAlignment = .left
        player1Score.numberOfLines = 0
        player1Score.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        player1Score.text =
        """
        Score
        Player 1:
        """
        view.addSubview(player1Score)
        
        player2Score = UILabel()
        player2Score.translatesAutoresizingMaskIntoConstraints = false
        player2Score.numberOfLines = 0
        player2Score.textAlignment = .right
        player2Score.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)

        player2Score.text =
        """
        Score
        Player 2:
        """
        view.addSubview(player2Score)
        
        totalScore = UILabel()
        totalScore.translatesAutoresizingMaskIntoConstraints = false
        totalScore.backgroundColor = .white
        totalScore.text = "Total Score :"
        totalScore.numberOfLines = 0
        totalScore.textAlignment = .left
        totalScore.font = UIFont.systemFont(ofSize: 44)
        
        targetScore = UILabel()
        targetScore.translatesAutoresizingMaskIntoConstraints = false
        targetScore.backgroundColor = .white
        targetScore.text = "Target Score :"
        targetScore.numberOfLines = 0
        targetScore.backgroundColor = .systemRed
        targetScore.textAlignment = .center
        targetScore.font = UIFont.systemFont(ofSize: 44)
        

        let scoresSubview = UIView()
        scoresSubview.translatesAutoresizingMaskIntoConstraints = false
        scoresSubview.addSubview(totalScore)
        scoresSubview.addSubview(targetScore)
        view.addSubview(scoresSubview)
        
        winCalculator = UITextView()
        winCalculator.translatesAutoresizingMaskIntoConstraints = false
        winCalculator.textAlignment = .center
        winCalculator.text = "WIN PREDICTOR ... PLACE YOUR BETS !!"
        winCalculator.isUserInteractionEnabled = false
        winCalculator.font = UIFont.systemFont(ofSize: 44)
        view.addSubview(winCalculator)
        
        
        let height = 30
        let width = 30
        //7 buttons with 1 column and 7 rows so 30*7 = 210 width
        let scoreButtonSubview = UIView()
        scoreButtonSubview.translatesAutoresizingMaskIntoConstraints = false
        scoreButtonSubview.backgroundColor = .white
        for  val in 0...6 {
            print(val)
            let scoreButton = UIButton(type: .system)
            scoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
            scoreButton.setTitleShadowColor(.systemRed, for: .normal)
            // give the button some temporary text so we can see it on-screen
            scoreButton.setTitle("\(val)", for: .normal)
            scoreButton.contentVerticalAlignment = .center
            // calculate the frame of this button using its column and row

            let frame = CGRect(x: val * width + 40, y: height, width: width, height: height)
            scoreButton.frame = frame
            
            scoreButtonSubview.addSubview(scoreButton)
            scoreButtons.append(scoreButton)
        }
        view.addSubview(scoreButtonSubview)
        
        let teamListSubview = UIView()
        teamListSubview.translatesAutoresizingMaskIntoConstraints = false
        teamListSubview.backgroundColor = .systemGreen

        view.addSubview(teamListSubview)
        let twidth = 150
        let theight = 80

        //to access namesofplayers array
        var arrayCounter = 0

        
        //create 12 buttons in a 5 X 3 grid with first being just the Team list
        

        for row in 0..<3 {
            for col in 0..<4 {
                let teamPlayerButton = UIButton(type: .system)
                teamPlayerButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
                teamPlayerButton.setTitleShadowColor(.gray, for: .normal)
                teamPlayerButton.backgroundColor = .white
                teamPlayerButton.layer.borderWidth = 2
                teamPlayerButton.layer.cornerRadius = 5
                // give the button some temporary text so we can see it on-screen
                teamPlayerButton.setTitle("\(Self.nameOfPlayers[arrayCounter])", for: .normal)

                // calculate the frame of this button using its column and row
                let frame = CGRect(x: (col * twidth) + 5 , y: row * theight, width: twidth, height: theight)
                teamPlayerButton.frame = frame

                // add it to the buttons view
                teamListSubview.addSubview(teamPlayerButton)

                // and also to our letterButtons array
                playerNames.append(teamPlayerButton)
                arrayCounter += 1
            }
        }
            
        
    
        NSLayoutConstraint.activate([
            //player1score
            player1Score.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            player1Score.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            player1Score.heightAnchor.constraint(greaterThanOrEqualToConstant: 44),
            
            //player2score
            player2Score.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            player2Score.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            player2Score.heightAnchor.constraint(greaterThanOrEqualToConstant: 44),

            //setting scoreSubview xcenter, topanchor , width and height, bottom
            scoresSubview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),
            scoresSubview.heightAnchor.constraint(equalToConstant: 160),
            scoresSubview.topAnchor.constraint(equalTo: player1Score.bottomAnchor, constant: 20),
            scoresSubview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //then setup subview target and total
            totalScore.topAnchor.constraint(equalTo: scoresSubview.topAnchor, constant: 5),
            totalScore.leadingAnchor.constraint(equalTo: scoresSubview.leadingAnchor, constant: 5),
            
            targetScore.topAnchor.constraint(equalTo: scoresSubview.topAnchor, constant: 5),
            targetScore.trailingAnchor.constraint(equalTo: scoresSubview.trailingAnchor, constant: 5),
            targetScore.leftAnchor.constraint(equalTo: totalScore.rightAnchor, constant: 1),
            targetScore.heightAnchor.constraint(equalTo: totalScore.heightAnchor),
            targetScore.widthAnchor.constraint(equalTo: totalScore.widthAnchor),
            
            winCalculator.topAnchor.constraint(equalTo: scoresSubview.bottomAnchor, constant: 20),
            winCalculator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            winCalculator.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            winCalculator.heightAnchor.constraint(equalToConstant: 160),
            
            scoreButtonSubview.topAnchor.constraint(equalTo: winCalculator.bottomAnchor, constant: 20),
            scoreButtonSubview.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            scoreButtonSubview.heightAnchor.constraint(equalToConstant: 60),
            scoreButtonSubview.widthAnchor.constraint(equalTo: scoresSubview.widthAnchor, multiplier: 0.5),
            
            //setting team list grid 3 * 4
            teamListSubview.topAnchor.constraint(equalTo: scoreButtonSubview.bottomAnchor, constant: 20),
            teamListSubview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            teamListSubview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),
            teamListSubview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.6),
            
            teamListSubview.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20 )
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    

}

