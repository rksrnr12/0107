//
//  ViewController.swift
//  0107
//
//  Created by 한국 on 2022/01/07.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var Label: UILabel!
    
    @IBOutlet var TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Label.text = "hi"
        // Do any additional setup after loading the view.
    }

    @IBAction func Btn(_ sender: UIButton) {
        Label.text = TextField.text
        
        let myNumber = checkNumber(text: TextField.text!, number: "7")
        if  myNumber == 7{
            moveToController(Controller: "webViewController")
        }
    }
    
    func moveToController(Controller:String){
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: Controller)
                self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
    func checkNumber(text: String,number: String) -> Int  {
        var anything = 0
        let textHaveNumber = text.hasPrefix(number)
        if textHaveNumber {
             let numberInt = Int(number)
             return numberInt!
        }
        return anything
    }
    
}

