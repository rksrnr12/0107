//
//  datePickerViewController.swift
//  0107
//
//  Created by 한국 on 2022/01/08.
//

import UIKit

class datePickerViewController: UIViewController {
    
    
    @IBOutlet var currentTime: UILabel!
    
    @IBOutlet var choiceTime: UILabel!
    
    let selector = #selector(datePickerViewController.updateTime) // 타이머가 구동되면 실행할 함수
    let interval = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: selector, userInfo: nil, repeats: true)
          //타이머 설절 timeInterval = 간격, target은 동작될 view, self는 지금있는 뷰 selector = 타이머가 구동되면 실행되는 함수
     }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        
        let datePicker = sender //날짜를 고르면 전달되는 UIDatePicker자료형의 인수가 전달되는 sender를 datePicker상수에 저장
        
        let format = DateFormatter() //날짜포멧지정을 위한 클래스사용을 위한 상수지정
        format.dateFormat = "yyyy-mm-dd: HH:mm:ss EEE"//날짜포멧 지정
        choiceTime.text = "선택시간: " + format.string(from: datePicker.date)//datePicker로 전달받은 정보를 string메서드를 사용하여 출력
        
    }
    
    @objc func updateTime(){
        let currentDate = NSDate()  //현재 날짜와 시간을 가져옴
        let dateFormat = DateFormatter() //날짜포멧클래스 사용을 위해 상수선언
        dateFormat.dateFormat = "yyyy-mm-dd: HH:mm:ss EEE" //날짜 포멧 지정
        currentTime.text = "현재시간: " + dateFormat.string(from: currentDate as Date) //현재날짜와 시간을 출력 string메서드를 사용하여 문자열로 변환
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
