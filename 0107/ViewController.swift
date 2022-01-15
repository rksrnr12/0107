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
        
        let myNumber = checkNumber(text: TextField.text!, number: "7") //숫자를 확인한 후 리턴받은 값은 상수에 넣어줌
        
        moveToController(Controller: myNumber) //입력받은 상수와 이름이 같은 뷰를 불러온다
        
    }
    
    func moveToController(Controller:String){ //원하는 뷰로 가기위한 함수
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: Controller)//입력받는 컨트롤러 이름을 갖는 뷰를 상수에 넣어준다
        self.navigationController?.pushViewController(pushVC!, animated: true) //위에 입력받은 뷰로 이동하기 위한 코드
    }
    
    func checkNumber(text: String,number: String) -> String  {
        
        let textHaveNumber = text.hasPrefix(number)//입력받은 텍스트안에 입력받은 숫자가 있는지 확인
        if textHaveNumber {
            return number //원하는 숫자가 있다면 그 숫자(string)를 리턴
        }
        return text //없다면 text를 리턴
    }
    
}

