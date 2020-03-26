//
//  ViewController.swift
//  Homework 2 - Blackjack
//
//  Created by Ruben Ruiz on 2/20/20.
//  Copyright © 2020 rubenruiz.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dealerCard1: UIImageView!
    @IBOutlet weak var dealerCard2: UIImageView!
    @IBOutlet weak var dealerCard3: UIImageView!
    @IBOutlet weak var dealerCard4: UIImageView!
    @IBOutlet weak var dealerCard5: UIImageView!
    @IBOutlet weak var dealerCard6: UIImageView!
    @IBOutlet weak var dealerCard7: UIImageView!
    @IBOutlet weak var dealerCard8: UIImageView!
    @IBOutlet weak var dealerCard9: UIImageView!
    @IBOutlet weak var dealerCard10: UIImageView!
    @IBOutlet weak var dealerCard11: UIImageView!
    @IBOutlet weak var dealerCard12: UIImageView!
    @IBOutlet weak var playerCard1: UIImageView!
    @IBOutlet weak var playerCard2: UIImageView!
    @IBOutlet weak var playerCard3: UIImageView!
    @IBOutlet weak var playerCard4: UIImageView!
    @IBOutlet weak var playerCard5: UIImageView!
    @IBOutlet weak var playerCard6: UIImageView!
    @IBOutlet weak var playerCard7: UIImageView!
    @IBOutlet weak var playerCard8: UIImageView!
    @IBOutlet weak var playerCard9: UIImageView!
    @IBOutlet weak var playerCard10: UIImageView!
    @IBOutlet weak var playerCard11: UIImageView!
    @IBOutlet weak var playerCard12: UIImageView!
    @IBOutlet weak var betLabel: UILabel!
    @IBOutlet weak var winningLabel: UILabel!
    
    var betPlaced: Bool    = false
    var winnings : Float   = 100
    var bets     : Float   = 0
    var deck:BlackjackDeck = BlackjackDeck()
    var playerCards:[Card] = []
    var dealerCards:[Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        betLabel.text = String(format:"Bet: $%.0f", bets)
        if betPlaced {
            dealCards()
            betLabel.text = "$\(bets)"
            winningLabel.text = "$\(winnings)"            
        }
        // Do any additional setup after loading the view.
    }
    
    func dealCards() {
        playerCards.append(deck.deal())
        dealerCards.append(deck.deal())
        playerCards.append(deck.deal())
        dealerCards.append(deck.deal())
        showPlayerCards()
    }
    
    func showPlayerCards() {
        
        let count:Int = playerCards.count
        
        if count == 2 {
            playerCard1.image = UIImage(named:"\(playerCards[0].label)_of_\(playerCards[0].getSuite())")
            playerCard2.image = UIImage(named:"\(playerCards[1].label)_of_\(playerCards[1].getSuite())")
        }
        if count > 2 {
            playerCard3.image = UIImage(named:"\(playerCards[2].label)_of_\(playerCards[2].getSuite())")
        }
        if count > 3 {
            playerCard4.image = UIImage(named:"\(playerCards[3].label)_of_\(playerCards[3].getSuite())")
        }
        if count > 4 {
            playerCard5.image = UIImage(named:"\(playerCards[4].label)_of_\(playerCards[4].getSuite())")
        }
        if count > 5 {
            playerCard6.image = UIImage(named:"\(playerCards[5].label)_of_\(playerCards[5].getSuite())")
        }
        if count > 6 {
            playerCard7.image = UIImage(named:"\(playerCards[6].label)_of_\(playerCards[6].getSuite())")
        }
        if count > 7 {
            playerCard8.image = UIImage(named:"\(playerCards[7].label)_of_\(playerCards[7].getSuite())")
        }
        if count > 8 {
            playerCard9.image = UIImage(named:"\(playerCards[8].label)_of_\(playerCards[8].getSuite())")
        }
        if count > 9 {
            playerCard10.image = UIImage(named:"\(playerCards[9].label)_of_\(playerCards[9].getSuite())")
        }
        if count > 10 {
            playerCard11.image = UIImage(named:"\(playerCards[10].label)_of_\(playerCards[10].getSuite())")
        }
        if count > 11 {
            playerCard12.image = UIImage(named:"\(playerCards[11].label)_of_\(playerCards[11].getSuite())")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC: PlaceBetViewController = segue.destination as! PlaceBetViewController
        destinationVC.maxValue = winnings
    }
    
    func showPlaceBetAlert() {
        let alertController = UIAlertController(title: "Place your bet.", message: "Hold on there boss, you need to place your bet first!", preferredStyle: UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        present(alertController, animated: true, completion: nil)
    }
    
    func gameOver() -> Bool {
        var playerHandValue: Int = getPlayerValue()
        var isGameOver: Bool = false
        
        isGameOver = playerHandValue > 21
        
        return isGameOver
        
        
    }
    
    func getPlayerValue() -> Int {
        var playerValue: Int = 0
        for playerCard in playerCards {
            if(playerCard.getValue().count == 1 || playerValue + playerCard.getValue()[1] > 21) {
                playerValue += playerCard.getValue()[0]
            }
            else {
                playerValue += playerCard.getValue()[1]
            }
        }
        print(playerValue)
        return playerValue
    }
    
    @IBAction func drawButtonPressed(_ sender: Any) {
        if !betPlaced {
            showPlaceBetAlert()
        }
        else if(playerCards.count < 12 && !gameOver()){
            playerCards.append(deck.deal())
            showPlayerCards()
            if gameOver() {
                showBustMessage()
            }
        }
        else {
            let alertController = UIAlertController(title: "Hold On there champ...", message: "You should have busted by now", preferredStyle: UIAlertController.Style.alert)

            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

            present(alertController, animated: true, completion: nil)
        }
        
    }
    
    func showBustMessage() {
        
        let alertController = UIAlertController(title: "BUST", message: "You have \(getPlayerValue()), which is greater than 21", preferredStyle: UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        present(alertController, animated: true, completion: nil)
        showDealerHandAndPlayforDealer()
        winnings -= bets
        bets = 0.0
        betPlaced = false
        betLabel.text = "$\(bets)"
        winningLabel.text = "$\(winnings)"
        reset()
        
    }
    
    func showDealerHandAndPlayforDealer() {
        
        showDealerCards()
        var dealerHandValue: Int = getDealerHandValue()
        while dealerHandValue < 17 {
            dealerCards.append(deck.deal())
            showDealerCards()
            dealerHandValue = getDealerHandValue()
        }
        showDealerCards()
        
    }
    
    func showDealerCards() {
        
        let count:Int = dealerCards.count
        
        if count == 2 {
            dealerCard1.image = UIImage(named:"\(dealerCards[0].label)_of_\(dealerCards[0].getSuite())")
            dealerCard2.image = UIImage(named:"\(dealerCards[1].label)_of_\(dealerCards[1].getSuite())")
        }
        if count > 2 {
            dealerCard3.image = UIImage(named:"\(dealerCards[2].label)_of_\(dealerCards[2].getSuite())")
        }
        if count > 3 {
            dealerCard4.image = UIImage(named:"\(dealerCards[3].label)_of_\(dealerCards[3].getSuite())")
        }
        if count > 4 {
            dealerCard5.image = UIImage(named:"\(dealerCards[4].label)_of_\(dealerCards[4].getSuite())")
        }
        if count > 5 {
            dealerCard6.image = UIImage(named:"\(dealerCards[5].label)_of_\(dealerCards[5].getSuite())")
        }
        if count > 6 {
            dealerCard7.image = UIImage(named:"\(dealerCards[6].label)_of_\(dealerCards[6].getSuite())")
        }
        if count > 7 {
            dealerCard8.image = UIImage(named:"\(dealerCards[7].label)_of_\(dealerCards[7].getSuite())")
        }
        if count > 8 {
            dealerCard9.image = UIImage(named:"\(dealerCards[8].label)_of_\(dealerCards[8].getSuite())")
        }
        if count > 9 {
            dealerCard10.image = UIImage(named:"\(dealerCards[9].label)_of_\(dealerCards[9].getSuite())")
        }
        if count > 10 {
            dealerCard11.image = UIImage(named:"\(dealerCards[10].label)_of_\(dealerCards[10].getSuite())")
        }
        if count > 11 {
            dealerCard12.image = UIImage(named:"\(dealerCards[11].label)_of_\(dealerCards[11].getSuite())")
        }
        
    }
    
    func getDealerHandValue() -> Int {
        
        var dealerValue: Int = 0
        for dealerCard in dealerCards {
            if(dealerCard.getValue().count == 1 || dealerValue + dealerCard.getValue()[1] > 21) {
                dealerValue += dealerCard.getValue()[0]
            }
            else {
                dealerValue += dealerCard.getValue()[1]
            }
        }
        print(dealerValue)
        return dealerValue
        
    }
    
    @IBAction func standButtonPressed(_ sender: Any) {
        if !betPlaced {
            showPlaceBetAlert()
        }
        showDealerHandAndPlayforDealer()
        compareHandsAndGetWinner()
    }
    
    func compareHandsAndGetWinner() {
        let playerHand:Int = getPlayerValue(),
            dealerHand = getDealerHandValue()
        
        if playerHand > dealerHand {
            winnings += bets
            bets = 0.0
            betPlaced = false
            showWinningMessage()
        }
        else if dealerHand > playerHand {
            winnings -= bets
            bets = 0.0
            betPlaced = false
            showLosingMessage()
        }
        else {
            bets = 0.0
            betPlaced = false
            showPushMessage()
        }
        betLabel.text = "$\(bets)"
        winningLabel.text = "$\(winnings)"
        reset()
        
    }
    
    func reset() {
        playerCards = []
        dealerCards = []
        dealerCard1.image = UIImage(named:"back_red")
        dealerCard2.image = UIImage(named:"back_red")
        playerCard1.image = UIImage(named:"back_blue")
        playerCard2.image = UIImage(named:"back_blue")
        playerCard3.image = UIImage(named:"")
        playerCard4.image = UIImage(named:"")
        playerCard5.image = UIImage(named:"")
        playerCard6.image = UIImage(named:"")
        playerCard7.image = UIImage(named:"")
        playerCard8.image = UIImage(named:"")
        playerCard9.image = UIImage(named:"")
        playerCard10.image = UIImage(named:"")
        playerCard11.image = UIImage(named:"")
        playerCard12.image = UIImage(named:"")
        dealerCard3.image = UIImage(named:"")
        dealerCard4.image = UIImage(named:"")
        dealerCard5.image = UIImage(named:"")
        dealerCard6.image = UIImage(named:"")
        dealerCard7.image = UIImage(named:"")
        dealerCard8.image = UIImage(named:"")
        dealerCard9.image = UIImage(named:"")
        dealerCard10.image = UIImage(named:"")
        dealerCard11.image = UIImage(named:"")
        dealerCard12.image = UIImage(named:"")
        checkLoans()
        
    }
    
    func checkLoans() {
        if winnings == 0 {
            
            
            winnings = 100
            betLabel.text = "$\(bets)"
            winningLabel.text = "$\(winnings)"
            
            let alertController = UIAlertController(title: "BANKRUPT!!!", message: "Here's a small loan...", preferredStyle: UIAlertController.Style.alert)

            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

            present(alertController, animated: true, completion: nil)
            
        }
    }
    
    func showWinningMessage() {
        let alertController = UIAlertController(title: "You Win!!!", message: "You Won!", preferredStyle: UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        present(alertController, animated: true, completion: nil)
    }
    
    func showLosingMessage() {
        let alertController = UIAlertController(title: "You lost", message: "You Lost!", preferredStyle: UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        present(alertController, animated: true, completion: nil)
    }
    
    func showPushMessage() {
        let alertController = UIAlertController(title: "It's a tie", message: "It's a tie", preferredStyle: UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func placeYourBetButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "placeYourBetSegue", sender: self)
    }
    
    
}

class BlackjackDeck {
    
    var deck:[Card]
    var numCardsLeft: Int
    let values: [[Int]] = [[2],[3],[4],[5],[6],[7],[8],[9],[10],[10],[10],[10],[1,11]]
    let labels: [String] = ["2","3","4","5","6","7","8","9","10","jack","queen","king", "ace"]
    let suites: [String] = ["clubs", "diamonds", "hearts", "spades"]
    
    init() {
        
        deck = []
        numCardsLeft = 52
        for suite in suites {
            for value in 0...values.count - 1 {
                deck.append(Card(value: values[value], suite: suite, label: labels[value]))
            }
        }
        shuffle()
        
    }
    
    func shuffle() {
        for number in 0...51 {
            var randomNum: Int = Int(arc4random_uniform(51))
            var tempCard: Card = deck[number]
            deck[number] = deck[randomNum]
            deck[randomNum] = tempCard
            
        }
    }
    func deal() -> Card{
        if numCardsLeft == 0 {
            shuffle()
        }
        let drawnCard: Card = deck.removeFirst()
        deck.append(drawnCard)
        return drawnCard
    }
    
}

class Card {
    var label: String
    var value: [Int]
    var suite: String
    
    init(value: [Int], suite: String, label:String) {
        self.value = value
        self.suite = suite
        self.label = label
    }
    
    func getValue() -> [Int] {
        return value
    }
    
    func getSuite() -> String {
        return suite
    }
    
    
}

