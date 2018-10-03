//
//  MainViewController.swift
//  Por Maghz
//
//  Created by Nima Akbarzade on 9/14/18.
//  Copyright © 2018 Nima Akbarzade. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var singlePlayerButton: UIButton!
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
//        UIDevice.current.identifierForVendor?.uuidString
//        print(UIDevice.current.identifierForVendor?.uuidString)
        makeViewCircular(view: singlePlayerButton)
        
    }

    func makeViewCircular(view: UIView) {
//        view.layer.cornerRadius = view.bounds.size.width / 2.0
//        view.clipsToBounds = true
//        view.frame = CGRectMake(0, 0, 100, 100)
//        view.layer.borderColor = UIColor.whiteColor().CGColor
//        view.layer.borderWidth = 2
//        view.layer.cornerRadius = 50
//        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        view.layer.masksToBounds = false
//        view.layer.shadowRadius = 1.0
//        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = singlePlayerButton.frame.width / 2
//        view.setTitle("button", forState: .Normal)
//        view.backgroundColor = UIColor.blueColor()
//        view.addTarget(self, action: "buttonAction", forControlEvents: .TouchUpInside)
//        view.setTitleColor(UIColor(red: 233/255, green: 64/255, blue: 87/255, alpha: 1), forState: UIControlState.Normal)

    }
    
    @IBAction func singlePlayerActionButton(_ sender: Any) {
        if counter <= 3 {
            let randomx = Int(arc4random_uniform(UInt32(view.frame.maxX - 100)))
            let randomy = Int(arc4random_uniform(UInt32(view.frame.maxY - 100)))
            UIView.animate(withDuration: 0.2) {
                self.singlePlayerButton.frame.origin = CGPoint(x: randomx, y: randomy)
            }
            counter = counter + 1
        print("\(counter)")
        }
        if counter > 3 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "game")
            self.present(controller, animated: true, completion: nil)
            
            // Safe Present
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "game") as? ViewController
            {
                self.present(vc, animated: true, completion: nil)
            }
        }
        
        
    }
    
}
