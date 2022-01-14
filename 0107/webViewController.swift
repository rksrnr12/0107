//
//  webViewController.swift
//  0107
//
//  Created by 한국 on 2022/01/14.
//

import UIKit
import WebKit

class webViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WebPage(url: "http://naver.com")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonGo(_ sender: UIButton) {
        
    }
    @IBAction func buttonSite1(_ sender: UIButton) {
        WebPage(url: "http://google.com")
    }
    @IBAction func buttonSite2(_ sender: UIButton) {
        WebPage(url: "http://Kream.co.kr")
    }
    @IBAction func buttonHtml(_ sender: UIButton) {
        let html = "<h1>안녕하세요</h1>"
        webView.loadHTMLString(html, baseURL: nil)
    }
    @IBAction func buttonFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "table", ofType: "html")
        let url = URL(fileURLWithPath: filePath!)
        let Request = URLRequest(url: url)
        
        webView.load(Request)
    }
    @IBAction func BarButtonStop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    @IBAction func BarButtonRefresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    @IBAction func BarButtonBack(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    @IBAction func BarButtonForward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    func WebPage(url: String){
        let Url = URL(string: url)
        let Request = URLRequest(url: Url!)
        webView.load(Request)
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
