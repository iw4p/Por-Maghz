//
//  Check.swift
//  Por Maghz
//
//  Created by Nima Akbarzade on 7/21/18.
//  Copyright © 2018 Nima Akbarzade. All rights reserved.
//

import Foundation
import UIKit

class Check {
    var tiles = [1]
    var answer = false
    var numberOfMistakes = 0
    var numberOfRights = 0
    var array : [Int] = []
    var level : Int = 0
    var timer : Double = 1
    var color = UIColor.cyan
    var removed : [Int] = [0]
    var tileColor = UIColor.white
    var allMistakes = 0
    var numberOfRandom = 4
    var numberOfQuestions = 1
    func toggle()  {
        array.removeDuplicates()
    }
    func buttonsHidden(button: [UIButton], number: Int) {
        button[number].isHidden = false
    }
    
    
    let color1 = [UIColor(hexString: "#16a085"),UIColor(hexString: "#27ae60"),UIColor(hexString: "#2980b9"),UIColor(hexString: "#8e44ad"),UIColor(hexString: "#2c3e50"),UIColor(hexString: "#f39c12"),UIColor(hexString: "#d35400"),UIColor(hexString: "#c0392b"),UIColor(hexString: "#bdc3c7"),UIColor(hexString: "#7f8c8d"),UIColor(hexString: "#673AB7"),UIColor(hexString: "#8BC34A"),UIColor(hexString: "#17c0eb")]
    
    let color2 = [UIColor(hexString: "#1abc9c"),UIColor(hexString: "#2ecc71"),UIColor(hexString: "#3498db"),UIColor(hexString: "#9b59b6"),UIColor(hexString: "#34495e"),UIColor(hexString: "#f1c40f"),UIColor(hexString: "#e67e22"),UIColor(hexString: "#e74c3c"),UIColor(hexString: "#ecf0f1"),UIColor(hexString: "#95a5a6"),UIColor(hexString: "#FFEB3B"),UIColor(hexString: "#CDDC39"),UIColor(hexString: "#18dcff")]

    
    func status() {
        

        
        switch level {
//        case 0:
//            color = UIColor.cyan
//            tileColor = #colorLiteral(red: 0.9490196078, green: 0.5921568627, blue: 0.2156862745, alpha: 1)
        case 2:
//            numberOfQuestions = 4
            color = (color1.randomItem() as UIColor??)!!
            tileColor = (color2.randomItem() as UIColor??)!!
            tiles = [1]
        case 3:
//            numberOfQuestions = 5
            timer = 0.8
//            color = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
//            tileColor = UIColor.cyan
            color = (color1.randomItem() as UIColor??)!!
            tileColor = (color2.randomItem() as UIColor??)!!
            tiles = [2]

        case 4:
//            numberOfQuestions = 6
            timer = 0.6
//            color = #colorLiteral(red: 0.8266174197, green: 1, blue: 0.9305718541, alpha: 1)
//            tileColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            color = (color1.randomItem() as UIColor??)!!
            tileColor = (color2.randomItem() as UIColor??)!!
        case 5:
            color = (color1.randomItem() as UIColor??)!!
            tileColor = (color2.randomItem() as UIColor??)!!
//        case 6:
//            color = UIColor.random()
//            tileColor = UIColor.random()
//        case 20:
//            numberOfQuestions = 7
//            timer = 0.4
//
//        case 25:
//            numberOfQuestions = 8
//
//        case 30:
//            numberOfQuestions = 9


        default:
            print("nothing")
            color = (color1.randomItem() as UIColor??)!!
            tileColor = (color2.randomItem() as UIColor??)!!
        }
 
        
    }
   
    func reset() {
        color = (color1.randomItem() as UIColor??)!!
        tileColor = (color2.randomItem() as UIColor??)!!
        numberOfRights = 0
        numberOfMistakes = 0
        numberOfQuestions = 1
        level = 0
        toggle()
        allMistakes = 0
        toggle()
        numberOfRandom = 4
    }
    
//    func animation(with duration:Int, button: [UIButton], number: Int, x:CGFloat, y:CGFloat) {
//        UIView.animate(withDuration: 1, animations: {
//            button[number].frame.origin.x = button[number].frame.origin.x + x
//            button[number].frame.origin.y = button[number].frame.origin.y + y
//            print("this is want i want :\(button[number].frame.size.height)")
//            print("this is want i want :\(button[number].frame.size.width)")
//
//        }, completion: nil)
//    }

}
