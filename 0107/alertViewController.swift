//
//  alertViewController.swift
//  0107
//
//  Created by 한국 on 2022/01/12.
//

import UIKit

class alertViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var image = ["lamp-on.png","lamp-off.png","lamp-remove.png",]
    var lampOn = true
    var lampRemove = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: image[0]) //처음 시작시 이미지를 지정

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnOn(_ sender: UIButton) {
        
        if lampOn == true {
            alert(message: "이미 켜져있습니다") //램프가 켜져있으면 켜져있다는 알림창을 생성
            
        }else{
            imageView.image = UIImage(named: image[0]) //램프가 꺼져있을시 켜진 이미지로 변경
            lampOn = true
            lampRemove = false
        }
    }
    
    @IBAction func btnOff(_ sender: UIButton) {
        
        if lampOn == true {
            imageView.image = UIImage(named: image[1]) //램프가 켜져있으면 꺼진 이미지로 변경
            lampOn = false
            lampRemove = false
        }else{
            alert(message: "이미 꺼져있습니다") //램프가 꺼져있으면 이미 꺼져있다는 알림창을 생성
        }
    }
    
    @IBAction func btnRemove(_ sender: UIButton) {
        if lampRemove == true {
            alert(message: "이미 제거되었습니다") //램프가 지워졌다면 이미 지워졌다는 알림을 생성
        }else{
            alertRemove() //램프가 지워진 이미지가 아니라면 지울지 정하는 알림을 생성
        }
    }
    
    func alert(message: String) { //알림메세지를 정할수있는 함수를 생성
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert) //기본 알림창을 생성 알림창 내용은 매개변수로 받아서 정함
        let alertAction = UIAlertAction(title: "네", style: .default, handler: nil) //알림창 버튼을 생성
        
        alert.addAction(alertAction) //알림창 버튼을 알림창에 추가
        present(alert, animated: true, completion: nil)//알림창을 나타내주는 함수를 사용
    }
    
    func alertRemove(){ //램프를 지우는지 물어보는 알림창을 위한 함수
        let alert = UIAlertController(title: "알림", message: "전구를 제거하겠습니까", preferredStyle: .alert) //기본 알림창 생성
        
        let onAction = UIAlertAction(title: "아니요 켜요", style: .default) { _ in self.imageView.image = UIImage(named:self.image[0]);
            self.lampOn = true; self.lampRemove = false} //램프를 켜는 알림창 버튼을 생성
        
        let offAction = UIAlertAction(title: "아니요 꺼요", style: .default) {_ in self.imageView.image = UIImage(named: self.image[1]);
            self.lampOn = false; self.lampRemove = false} //램프를 끄는 알림창 버튼을 생성
        
        let removeAction = UIAlertAction(title: "네", style: .default) { _ in self.imageView.image = UIImage(named: self.image[2]);
            self.lampRemove = true } //램프를 지우는 알림창 버튼을 생성
        
        alert.addAction(removeAction)
        alert.addAction(onAction) //각각 만든 버튼을 알림창에 추가
        alert.addAction(offAction)
        
        present(alert, animated: true, completion: nil) //알림창을 나타내는 함수를 사용
        
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


