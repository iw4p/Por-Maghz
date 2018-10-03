//
//  resultViewController.swift
//  Por Maghz
//
//  Created by Nima Akbarzade on 8/7/18.
//  Copyright © 2018 Nima Akbarzade. All rights reserved.
//

import UIKit
import Parse

class resultViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var statusLabel: UILabel!
    
    
    @IBOutlet var playerNameTF: UITextField!
    
    @IBOutlet var firstPlayerLabel: UILabel!
    
    @IBOutlet var secondPlayerLabel: UILabel!
    
    @IBOutlet var thirdPlayerLabel: UILabel!
    
    func x() {
        var arrayBestPlayersName = [String]()
        var arrayBestPlayersScore = [Int]()
        let query = PFQuery(className:"GameScore")
        query.order(byDescending: "score")
        query.cachePolicy = .networkElseCache
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            if error == nil {
                // Results were successfully found, looking first on the
                // network and then on disk.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        arrayBestPlayersName.append(object["playerName"] as! String)
                        arrayBestPlayersScore.append(object["score"] as! Int)
                    }
                }
                print(arrayBestPlayersName[0])
                
                self.firstPlayerLabel.text = "\(arrayBestPlayersName[0]) record: \(arrayBestPlayersScore[0])"
                self.secondPlayerLabel.text = "\(arrayBestPlayersName[1]) record: \(arrayBestPlayersScore[1])"
                self.thirdPlayerLabel.text = "\(arrayBestPlayersName[2]) record: \(arrayBestPlayersScore[2])"

            } else {
                // The network was inaccessible and we have no cached data for
                // this query.
                
                print("Error: \(error!) \(String(describing: error!._userInfo))")
            }
        }
//        query.findObjectsInBackground { (objects, error) in
//            if error == nil {
//                // The find succeeded.
//
//            } else {
//                // Log details of the failure
//            }
//        }

//        query.whereKey("playerUUID", equalTo: UIDevice.current.identifierForVendor?.uuidString)
//        query.findObjectsInBackground {(objects : [AnyObject]?, error: Error?)-> Void in
//            if error == nil {
//                // The find succeeded.
//                print("Successfully retrieved \(objects!.count) scores.")
//                // Do something with the found objects
//                if let objects = objects {
//                    for object in objects {
//                        print(object.objectId)
//                    }
//                }
//            } else {
//                // Log details of the failure
//                print("Error: \(error!) \(error!._userInfo)")
//            }
//        }
        
        
        
        
        
    }
    
    @IBOutlet var leaderboardButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerNameTF?.delegate = self
        leaderboardButton?.isUserInteractionEnabled = false
        leaderboardButton?.alpha = 0.5
        self.hideKeyboardWhenTappedAround()
        x()
        
        //SAVE SCORE ON DEVICE
        let userDefaults = UserDefaults.standard
//        let highscoresaved = userDefaults.integer(forKey: "highscore")
        if userDefaults.value(forKey: "highscore") != nil {
//            print("haha\(userDefaults.integer(forKey: "highscore"))")
            statusLabel.text = String("Your HighScore: \(userDefaults.integer(forKey: "highscore"))")
        }
        else {
            // no highscore exists
        }
        //PARSE SCORES
       
//        var query = PFQuery(className:"GameScore")
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (playerNameTF.text! as NSString).replacingCharacters(in: range, with: string)
        if !text.isEmpty{
            leaderboardButton?.isUserInteractionEnabled = true
            leaderboardButton?.alpha = 1.0
        } else {
            leaderboardButton?.isUserInteractionEnabled = false
            leaderboardButton?.alpha = 0.5
        }
        return true
    }
    
    @IBAction func leaderBoard(_ sender: Any) {
        
       
        
        let gameScore = PFObject(className:"GameScore")
        let userDefaults = UserDefaults.standard
        let uuid = UIDevice.current.identifierForVendor!.uuidString
        
        print(uuid)
        let highscoresaved = userDefaults.integer(forKey: "highscore")
        
//        var query = PFQuery(className:"GameScore")
//        query.whereKey("UUID", equalTo: uuid)
//        query.findObjectsInBackground(block: { (gameScore, error) in
//            if error != nil {
//                print(error!)
//            } else if let gameScore = gameScore {
//                for gameScores in gameScore {
//                    gameScores["playerName"] = self.playerNameTF.text
//                    gameScores["score"] = 1338
//                    gameScores["playerUUID"] = uuid
//                    gameScores.saveInBackground()
//                }
//
//            }
//        })
        
//        query.whereKey("playerUUID", equalTo: uuid!)
//        query.getFirstObjectInBackground {
//            (object: PFObject?, error: Error?) -> Void in
//            if error != nil || object == nil {
//                gameScore["score"] = highscoresaved
//                gameScore["playerName"] = self.playerNameTF.text
//                gameScore["playerUUID"] = uuid
//                gameScore.saveInBackground {
//                    (success: Bool, error: Error?) in
//                    if (success) {
//                        print("SUCCESSSSS")
//                    } else {
//                        // There was a problem, check error.description
//                    }
//                }
//            } else {
//                // The find succeeded.
//                print("Successfully retrieved the object.")
//
//            }
//        }
//        let query = PFQuery(className:"GameScore")
//        query.getFirstObjectInBackground { (object, error) in
//            if let object = object {
//                object["playerName"] = self.playerNameTF.text
//                object["score"] = highscoresaved
//                object["playerUUID"] = uuid
//                object.saveInBackground()
//            }
//        }
        
        // Then query and compare
        
//        let query = PFQuery(className:"GameScore")
//        query.getObjectInBackground(withId: "xWMyZEGZ") {
//            (gameScore: PFObject?, error: Error?) -> Void in
//            if error != nil {
//                print(error!)
//            } else if let gameScore = gameScore {
//                gameScore["cheatMode"] = true
//                gameScore["score"] = 1338
//                gameScore.saveInBackground()
//            }
//        }
        
        
        let query = PFQuery(className: "GameScore")
        query.cachePolicy = .networkOnly
        query.whereKey("playerUUID", equalTo:uuid)
        query.findObjectsInBackground(block: { (objects, error) in
            if error == nil {
                if (objects!.count > 0) {
                    self.statusLabel.text = String("Score updated successfully! ✅")
//                    gameScore["playerName"] = self.playerNameTF.text
//                    gameScore["score"] = highscoresaved
                    for obj in objects! {
                        obj["playerName"] = self.playerNameTF.text
                        obj["score"] = highscoresaved
//                        obj["UUID"] = uuid
                        obj.saveInBackground()
                    }
                } else {
                    self.statusLabel.text = String("Submitted Successfully! ✅")
//                    for obj in objects! {
                            gameScore["playerName"] = self.playerNameTF.text
                            gameScore["score"] = highscoresaved
                            gameScore["playerUUID"] = uuid
                            gameScore.saveInBackground()
//                        }
                }
            } else {
                print("error")
            }
        })
    }
}
