//
//  imageViewerViewController.swift
//  0107
//
//  Created by 한국 on 2022/01/08.
//

import UIKit

class imageViewerViewController: UIViewController {

    @IBOutlet var imgViewer: UIImageView!
    
    var image = ["1.png","2.png","3.png","4.png","5.png","6.png",]
    var imageCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgViewer.image = UIImage(named: image[imageCount])
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPrev(_ sender: UIButton) {
        imageCount = imageCount - 1
        if imageCount < 0 {
            imageCount = 0
        }
        imgViewer.image = UIImage(named: image[imageCount])
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        imageCount = imageCount + 1
        if imageCount > 5 {
            imageCount = 5
        }
        imgViewer.image = UIImage(named: image[imageCount])
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
