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
    var alarmTime:String? //알람시간을 넣어주기위한 변수선언
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: selector, userInfo: nil, repeats: true)
          //타이머 설절 timeInterval = 간격, target은 동작될 view, self는 지금있는 뷰 selector = 타이머가 구동되면 실행되는 함수
     }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        
        let datePicker = sender //날짜를 고르면 전달되는 UIDatePicker자료형의 인수가 전달되는 sender를 datePicker상수에 저장
        
        let format = DateFormatter() //날짜포멧지정을 위한 클래스사용을 위한 상수지정
        format.dateFormat = "yyyy-MM-dd: HH:mm:ss EEE"//날짜포멧 지정
        choiceTime.text = "선택시간: " + format.string(from: datePicker.date)//datePicker로 전달받은 정보를 string메서드를 사용하여 출력
        
        alarmTime = format.string(from: datePicker.date) //알람시간을 선언한 변수에 넣어준다
        
    }
    
    @objc func updateTime(){
        let currentDate = NSDate()  //현재 날짜와 시간을 가져옴
        let dateFormat = DateFormatter() //날짜포멧클래스 사용을 위해 상수선언
        dateFormat.dateFormat = "yyyy-MM-dd: HH:mm:ss EEE" //날짜 포멧 지정
        currentTime.text = "현재시간: " + dateFormat.string(from: currentDate as Date) //현재날짜와 시간을 출력 string메서드를 사용하여 문자열로 변환
        
        
        let current = dateFormat.string(from: currentDate as Date) //현재시간을 지정하기위한 상수 선언
        
        if alarmTime == current {
            alert() //알람시간과 현재시간이 일치하면 알림창을 나타내는 함수 지정
        }
            
        }
    
    func alert() {
        let alert = UIAlertController(title: "알람", message:"지정된 시간입니다" , preferredStyle:.alert)//알림창 설정
        let alertAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)//알림창 버튼을 설정
        
        alert.addAction(alertAction) //알림창안에 버튼을 넣어준다
        present(alert, animated: true, completion: nil) // 알림창을 나타내는 함수사용
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


