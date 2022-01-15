//
//  webMissonViewController.swift
//  0107
//
//  Created by 한국 on 2022/01/15.
//

import UIKit
import WebKit

class webMissonViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        file()

        // Do any additional setup after loading the view.
    }
    
    func url(url: String){
        let URL = URL(string: url) //입력받은 주소를 URL형으로 지정한다
        let requset = URLRequest(url: URL!)//지정한 URL형을 URLRequest형으로 선언
        
        webView.load(requset) //웹뷰에 입력받은 주소를 실행
    }
    
    func file(){
        let filepath = Bundle.main.path(forResource: "table", ofType: "html") //입력받은 파일을 패수변수를 이용해 상수에 넣어준다
        let url = URL(fileURLWithPath: filepath!) 
        let request = URLRequest(url: url)
        
        webView.load(request)
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
