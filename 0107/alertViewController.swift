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
        imageView.image = UIImage(named: image[0])

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnOn(_ sender: UIButton) {
        
        if lampOn == true {
            alert(message: "이미 켜져있습니다")
            
        }else{
            imageView.image = UIImage(named: image[0])
            lampOn = true
            lampRemove = false
        }
    }
    
    @IBAction func btnOff(_ sender: UIButton) {
        
        if lampOn == true {
            imageView.image = UIImage(named: image[1])
            lampOn = false
            lampRemove = false
        }else{
            alert(message: "이미 꺼져있습니다")
        }
    }
    
    @IBAction func btnRemove(_ sender: UIButton) {
        if lampRemove == true {
            alert(message: "이미 제거되었습니다")
        }else{
            alertRemove()
        }
    }
    
    func alert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "네", style: .default, handler: nil)
        
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    func alertRemove(){
        let alert = UIAlertController(title: "알림", message: "전구를 제거하겠습니까", preferredStyle: .alert)
        
        let onAction = UIAlertAction(title: "아니요 켜요", style: .default) { _ in self.imageView.image = UIImage(named:self.image[0]);
            self.lampOn = true; self.lampRemove = false}
        
        let offAction = UIAlertAction(title: "아니요 꺼요", style: .default) {_ in self.imageView.image = UIImage(named: self.image[1]);
            self.lampOn = false; self.lampRemove = false}
        
        let removeAction = UIAlertAction(title: "네", style: .default) { _ in self.imageView.image = UIImage(named: self.image[2]);
            self.lampRemove = true }
        
        alert.addAction(removeAction)
        alert.addAction(onAction)
        alert.addAction(offAction)
        
        present(alert, animated: true, completion: nil)
        
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


