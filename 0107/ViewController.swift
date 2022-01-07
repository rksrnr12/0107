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
    }
    
}

