//
//  ViewController.swift
//  Por Maghz
//
//  Created by Nima Akbarzade on 7/15/18.
//  Copyright © 2018 Nima Akbarzade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var buttonsArray: [UIButton]!
    
    
    public var check = Check()
    

    @IBAction func resetButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "UIAlertController", message: "Would you like to continue learning how to use iOS alerts?", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { _ in
        
            
        
        }))
        alert.addAction(UIAlertAction(title: "Reset", style: UIAlertActionStyle.cancel, handler: { _ in
            
          
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Main")
            self.present(controller, animated: true, completion: nil)
            
            // Safe Present
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main") as? ViewController
            {
                self.present(vc, animated: true, completion: nil)
            }
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func addTime(_ sender: Any) {
        print(check.numberOfMistakes)
        print(check.allMistakes)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let color1 = [UIColor(hexString: "#16a085"),UIColor(hexString: "#27ae60"),UIColor(hexString: "#2980b9"),UIColor(hexString: "#8e44ad"),UIColor(hexString: "#2c3e50"),UIColor(hexString: "#f39c12"),UIColor(hexString: "#d35400"),UIColor(hexString: "#c0392b"),UIColor(hexString: "#bdc3c7"),UIColor(hexString: "#7f8c8d")]
//        let color3 = ["#27ae60","#f39c12","#2c3e50"]

//        buttonsArray[1].backgroundColor = UIColor(hexString: color3.randomItem()!)
//        for button in buttonsArray {
//            button.backgroundColor = UIColor(hexString: "\(color3.randomItem())")
//        }
        
        for button in buttonsArray {
            button.setTitle("", for: .normal)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.round()
            self.check.toggle()
            self.check.level = 0
        }
        

    }
    override func viewWillAppear(_ animated: Bool) {

        buttonsArray[0].center.x -= view.bounds.height
        buttonsArray[1].center.x -= view.bounds.height
        buttonsArray[2].center.x += view.bounds.height
        buttonsArray[3].center.x += view.bounds.height
        buttonsArray[4].center.x -= view.bounds.height
        buttonsArray[5].center.x -= view.bounds.height
        buttonsArray[6].center.x += view.bounds.height
        buttonsArray[7].center.x += view.bounds.height
        buttonsArray[8].center.x -= view.bounds.height
        buttonsArray[9].center.x -= view.bounds.height
        buttonsArray[10].center.x += view.bounds.height
        buttonsArray[11].center.x += view.bounds.height
        buttonsArray[12].center.y -= view.bounds.width
        buttonsArray[13].center.y += view.bounds.width
        buttonsArray[14].center.y -= view.bounds.width
        buttonsArray[15].center.y += view.bounds.width
        buttonsArray[16].center.x -= view.bounds.height
        buttonsArray[17].center.x += view.bounds.height
        buttonsArray[18].center.x -= view.bounds.height
        buttonsArray[19].center.x += view.bounds.height
        buttonsArray[20].center.x += view.bounds.height
        buttonsArray[21].center.x -= view.bounds.height
        buttonsArray[22].center.x += view.bounds.height
        buttonsArray[23].center.x -= view.bounds.height
        buttonsArray[24].center.x += view.bounds.height
        buttonsArray[25].center.y -= view.bounds.width
        buttonsArray[26].center.x += view.bounds.height
        buttonsArray[27].center.y -= view.bounds.width
        buttonsArray[28].center.x += view.bounds.height
        buttonsArray[29].center.x += view.bounds.height
        
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0) {
            self.buttonsArray[0].center.x += self.view.bounds.height
            self.buttonsArray[1].center.x += self.view.bounds.height
            self.buttonsArray[2].center.x -= self.view.bounds.height
            self.buttonsArray[3].center.x -= self.view.bounds.height
        }
    }
   

    
    func resetGame() {
        check.reset()
        for button in self.buttonsArray {
            
            button.backgroundColor = check.tileColor
            button.isEnabled = true
        }
            self.navigationItem.title = "Level: \(self.check.level)"
        self.round()
    }
    
    func buttonsAction(number:Int) {
        if check.array.contains(number) {
            buttonsArray[number].backgroundColor = check.color
            check.numberOfRights = check.numberOfRights + 1
            print(check.numberOfRights)
            
        } else {
            buttonsArray[number].backgroundColor = UIColor.red
            buttonsArray[number].shake(shakeCount: 3)

            check.numberOfMistakes = check.numberOfMistakes + 1
            check.allMistakes = check.allMistakes + 1
        }
        buttonsArray[number].isEnabled = false
        
    }
    
    func finish(boolean:Bool) {
    
        if boolean == true {
            
                    check.numberOfRights = 0
                    check.numberOfMistakes = 0
                    for button in self.buttonsArray {
                        button.backgroundColor = check.tileColor
                        button.isEnabled = true
                    }
                    round()
            
        } else {
            
            let alert = UIAlertController(title: "Loser !", message: "sorry! you should try again and beat me", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK :( ", style: .cancel, handler: { action in
                switch action.style{

                case .cancel:
                    
                    //show last page
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "result")
                    self.present(controller, animated: true, completion: nil)
                    
                    // Safe Present
                    if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "result") as? resultViewController
                    {
                        self.present(vc, animated: true, completion: nil)
                    }


                case .default:
                    print("default")

                case .destructive:
                    print("destructive")

                }}))
            self.present(alert, animated: true, completion: nil)

            
        }
        
        
    }
    
    
    
//    func clickButton() {
//        if let vc = self.storyboard?.instantiateViewController(withIdentifier:"zzz") {
//            vc.modalTransitionStyle   = .crossDissolve
//            vc.modalPresentationStyle = .overCurrentContext
//            self.present(vc, animated: true, completion: nil)
//
//            func prepare(for segue: UIStoryboardSegue, sender: Any?)
//            {
//                if segue.destination is resultViewController
//                {
//                    let vc = segue.destination as? resultViewController
//                    vc?.mistakes = 90
//                }
//            }
//        }
//    }
    
    
    func highScore() {
        let highscore = check.level
        let userDefaults = UserDefaults.standard
        let highscoresaved = userDefaults.integer(forKey: "highscore")
        if highscore > highscoresaved{
            userDefaults.setValue(highscore, forKey: "highscore")
            userDefaults.synchronize()
        }
        
//        if userDefaults.value(forKey: "highscore") != nil {
//            print("haha\(userDefaults.integer(forKey: "highscore"))")
//            userDefaults.setValue(highscore, forKey: "highscore")
//        }
        else {
            // no highscore exists
        }
    }
    
    
    @IBAction func didHitButton(_ sender: UIButton) {
        
        highScore()
        
        print("number of rights \(check.numberOfRights)")
        print("number of mistakes \(check.numberOfMistakes)")
        print("array \(check.array)")
        print("number of all mistakes \(check.allMistakes)")
        print("level = \(check.level)")
               check.status()
        let level = check.level

        switch sender {
        case buttonsArray[0]:
           buttonsAction(number: 0)
        case buttonsArray[1]:
            buttonsAction(number: 1)
        case buttonsArray[2]:
            buttonsAction(number: 2)
        case buttonsArray[3]:
            buttonsAction(number: 3)
        case buttonsArray[4]:
            buttonsAction(number: 4)
        case buttonsArray[5]:
            buttonsAction(number: 5)
        case buttonsArray[6]:
            buttonsAction(number: 6)
        case buttonsArray[7]:
            buttonsAction(number: 7)
        case buttonsArray[8]:
            buttonsAction(number: 8)
        case buttonsArray[9]:
            buttonsAction(number: 9)
        case buttonsArray[10]:
            buttonsAction(number: 10)
        case buttonsArray[11]:
            buttonsAction(number: 11)
        case buttonsArray[12]:
            buttonsAction(number: 12)
        case buttonsArray[13]:
            buttonsAction(number: 13)
        case buttonsArray[14]:
            buttonsAction(number: 14)
        case buttonsArray[15]:
            buttonsAction(number: 15)
        case buttonsArray[16]:
            buttonsAction(number: 16)
        case buttonsArray[17]:
            buttonsAction(number: 17)
        case buttonsArray[18]:
            buttonsAction(number: 18)
        case buttonsArray[19]:
            buttonsAction(number: 19)
        case buttonsArray[20]:
            buttonsAction(number: 20)
        case buttonsArray[21]:
            buttonsAction(number: 21)
        case buttonsArray[22]:
            buttonsAction(number: 22)
        case buttonsArray[23]:
            buttonsAction(number: 23)
        case buttonsArray[24]:
            buttonsAction(number: 24)
        case buttonsArray[25]:
            buttonsAction(number: 25)
        case buttonsArray[26]:
            buttonsAction(number: 26)
        case buttonsArray[27]:
            buttonsAction(number: 27)
        case buttonsArray[28]:
            buttonsAction(number: 28)
        case buttonsArray[29]:
            buttonsAction(number: 29)
        default:
            print("f why it does not work")
        }
        
        if (check.numberOfRights) == (check.array.count){
            if level == 1 {
                buttonsArray[4].isHidden = false
                buttonsArray[5].isHidden = false
                buttonsArray[6].isHidden = false
                buttonsArray[7].isHidden = false
                UIView.animate(withDuration: 1.0) {
                    self.buttonsArray[4].center.x += self.view.bounds.height
                    self.buttonsArray[5].center.x += self.view.bounds.height
                    self.buttonsArray[6].center.x -= self.view.bounds.height
                    self.buttonsArray[7].center.x -= self.view.bounds.height
                }
                check.numberOfQuestions = 3
                check.numberOfRandom = 3
            }
            if level == 2 {
                check.numberOfRandom = 7
            }
            if level == 5 {
                buttonsArray[8].isHidden = false
                buttonsArray[9].isHidden = false
                buttonsArray[10].isHidden = false
                buttonsArray[11].isHidden = false
                UIView.animate(withDuration: 1.0) {
                    self.buttonsArray[8].center.x += self.view.bounds.height
                    self.buttonsArray[9].center.x += self.view.bounds.height
                    self.buttonsArray[10].center.x -= self.view.bounds.height
                    self.buttonsArray[11].center.x -= self.view.bounds.height
                }
                check.numberOfQuestions = 4
                check.numberOfRandom = 7
            }
            if level == 6 {
                check.numberOfRandom = 11
            }
            if level == 10 {
                buttonsArray[12].isHidden = false
                buttonsArray[13].isHidden = false
                buttonsArray[14].isHidden = false
                buttonsArray[15].isHidden = false
                UIView.animate(withDuration: 1.0) {
                    self.buttonsArray[12].center.y += self.view.bounds.width
                    self.buttonsArray[13].center.y -= self.view.bounds.width
                    self.buttonsArray[14].center.y += self.view.bounds.width
                    self.buttonsArray[15].center.y -= self.view.bounds.width
                }
                check.numberOfQuestions = 3
                check.numberOfRandom = 11
            }
            if level == 11 {
                check.numberOfRandom = 15
            }
            if level == 15 {
                buttonsArray[16].isHidden = false
                buttonsArray[17].isHidden = false
                buttonsArray[18].isHidden = false
                buttonsArray[19].isHidden = false
                UIView.animate(withDuration: 1.0) {
                    self.buttonsArray[16].center.x += self.view.bounds.height
                    self.buttonsArray[17].center.x -= self.view.bounds.height
                    self.buttonsArray[18].center.x += self.view.bounds.height
                    self.buttonsArray[19].center.x -= self.view.bounds.height
                }
                check.numberOfQuestions = 5
                check.numberOfRandom = 15
            }
            if level == 16 {
                check.numberOfRandom = 19
            }
            if level == 20 {
                buttonsArray[20].isHidden = false
                buttonsArray[21].isHidden = false
                buttonsArray[22].isHidden = false
                buttonsArray[23].isHidden = false
                UIView.animate(withDuration: 1.0) {
                    self.buttonsArray[20].center.x -= self.view.bounds.height
                    self.buttonsArray[21].center.x += self.view.bounds.height
                    self.buttonsArray[22].center.x -= self.view.bounds.height
                    self.buttonsArray[23].center.x += self.view.bounds.height
                }
                check.numberOfQuestions = 5
                check.numberOfRandom = 19
            }
            if level == 21 {
                check.numberOfRandom = 23
            }
            if level == 25 {
                buttonsArray[24].isHidden = false
                buttonsArray[25].isHidden = false
                buttonsArray[26].isHidden = false
                buttonsArray[27].isHidden = false
                UIView.animate(withDuration: 1.0) {
                    self.buttonsArray[24].center.x -= self.view.bounds.height
                    self.buttonsArray[25].center.y += self.view.bounds.width
                    self.buttonsArray[26].center.x -= self.view.bounds.height
                    self.buttonsArray[27].center.y += self.view.bounds.width
                }
                check.numberOfQuestions = 5
                check.numberOfRandom = 23
            }
            if level == 26 {
                check.numberOfRandom = 27
            }
            if level == 30 {
                buttonsArray[28].isHidden = false
                buttonsArray[29].isHidden = false
                UIView.animate(withDuration: 1.0) {
                    self.buttonsArray[28].center.x -= self.view.bounds.height
                    self.buttonsArray[29].center.x -= self.view.bounds.height
                }
                check.numberOfQuestions = 8
                check.numberOfRandom = 27
            }
            if level == 31 {
                check.numberOfRandom = 29
            }
            check.level = check.level + 1
            finish(boolean: true)
            for x in check.tiles {
                buttonsArray[x].isHidden = false
            }
        }
        
        if (check.numberOfMistakes) == 3 {
            finish(boolean: false)
            check.level = 0
            check.allMistakes = 0
        }
        
        
        
    }
    
    func round() {
        var i = 0
        var rightArray = [Int]()
        while (i < check.numberOfQuestions) {
            let random = Int(arc4random_uniform(UInt32(check.numberOfRandom)))
            print(random)
            buttonsArray[random].backgroundColor = check.color
            rightArray.append(random)
            i = i + 1
        }
        print(rightArray)
        rightArray.removeDuplicates()
            self.navigationItem.title = "Level: \(check.level)"
        check.array = rightArray
        check.removed = rightArray
        print("Try new removeduplicates \(check.array)")
            for button in self.buttonsArray {
                button.isEnabled = false
                DispatchQueue.main.asyncAfter(deadline: .now() + check.timer) {
                button.backgroundColor = self.check.tileColor
                button.showsTouchWhenHighlighted = true
                button.isEnabled = true
            }
        }
    }
}
