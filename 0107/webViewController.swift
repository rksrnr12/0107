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
        WebPage(url: "http://naver.com") //처음 시작시 웹페이지를 설정

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonGo(_ sender: UIButton) {
        let myUrl = checkUrl(url: textField.text!) //텍스트 필드에 적힌 주소를 muUrl 상수에 일력
        textField.text = "" //텍스트필드의 주소를 지우고 빈칸으로 만듬
        WebPage(url: myUrl) //텍스트필드의 적힌 주소를 로드
        
    }
    @IBAction func buttonSite1(_ sender: UIButton) { //site1버튼을 누르면 정해진 주소로 이동
        WebPage(url: "http://google.com")
    }
    @IBAction func buttonSite2(_ sender: UIButton) { //site2버튼을 누르면 정해진 주소로 이동
        WebPage(url: "http://Kream.co.kr")
    }
    @IBAction func buttonHtml(_ sender: UIButton) { //html 버튼을 누르면 간단한 html코드를 실행
        let html = "<h1>안녕하세요</h1>"
        webView.loadHTMLString(html, baseURL: nil)
    }
    @IBAction func buttonFile(_ sender: UIButton) { //file버튼을 클릭시 정해진 html파일을 실행
        let filePath = Bundle.main.path(forResource: "table", ofType: "html") //table.html파일을 찾아 filePath상수에 넣어준다
        let url = URL(fileURLWithPath: filePath!) //위에서 찾은 파일을 이용하여 URL변수를 생성한다
        let Request = URLRequest(url: url) //Request변수를 생성
         
        webView.load(Request) //생성한 변수를 이용하여 html파일을 실행
    }
    @IBAction func BarButtonStop(_ sender: UIBarButtonItem) { //x버튼을 클릭시 로딩을 멈춤
        webView.stopLoading()
    }
    @IBAction func BarButtonRefresh(_ sender: UIBarButtonItem) { //리로드 버튼을 누르면 화면을 새로고침
        webView.reload()
    }
    @IBAction func BarButtonBack(_ sender: UIBarButtonItem) { //이전버튼을 누르면 이전에 접속한 주소로 이동
        webView.goBack()
    }
    @IBAction func BarButtonForward(_ sender: UIBarButtonItem) { //다음버튼을 누르면 앞쪽에 접속한 주소로 이동
        webView.goForward()
    }
    
    func WebPage(url: String){
        let Url = URL(string: url) //일력받은 url 주소를 URL형으로 선언
        let Request = URLRequest(url: Url!) //Url상수를 받아 URLRequest형으로 선언
        webView.load(Request) //웹페이지를 로드함
    }
    
    func checkUrl(url: String) -> String{
        var URL = url //입력받은 url을 URL상수에 넣어줌
        let flag = url.hasPrefix("http://") //입력받은 url안에 입력한 문자가 있는지 확인한 값을 flag에 넣어줌
        if !flag {
            URL = "http://" + URL //지정한 문자가 없다면 "http://"를 넣어줌
        }
        return URL //URL을 리턴
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
