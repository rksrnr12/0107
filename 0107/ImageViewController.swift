//
//  ImageViewController.swift
//  0107
//
//  Created by 한국 on 2022/01/08.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet var ImgView: UIImageView!
    
    var imageState = false   //false = 일반상태 true =2배확대상태
    @IBOutlet var btnOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImgView.image = UIImage(named: "lamp_on.png")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Switch(_ sender: UISwitch) {
        if sender.isOn {
            ImgView.image = UIImage(named: "lamp_on.png")
        }else{
            ImgView.image = UIImage(named: "lamp_off.png")
        }
        
    }
    
    @IBAction func Button(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        
        var newWidth:CGFloat
        var newHeight:CGFloat
        
        if imageState == true {
            
            newWidth = ImgView.frame.width/scale
            newHeight = ImgView.frame.width/scale
            btnOutlet.setTitle("확대", for: .normal)
            
            
        }else{
            newWidth = ImgView.frame.width*scale
            newHeight = ImgView.frame.width*scale
            btnOutlet.setTitle("축소", for: .normal)
        }
        ImgView.frame.size = CGSize(width: newWidth, height: newHeight)
        imageState = !imageState
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
