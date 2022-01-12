//
//  pickerViewController.swift
//  0107
//
//  Created by 한국 on 2022/01/10.
//

import UIKit

class pickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var image = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg",]

    @IBOutlet var label: UILabel!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "사진이름 :" + image[0]        //초기실행시 나올 이미지와 레이블을 지정
        imgView.image = UIImage(named: image[0])

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { //피커뷰에서 보일 컴포넌트의 개수를 지정
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { //피커뷰의 표시되는 열의 개수
        return image.count
    }
    
    /*func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return image[row]  //피커뷰 각 열의 이름을 지정
    }*/
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) { //피커뷰를 선택하면 실행될 코드들
        if component == 0 { //첫번째 컴포넌트는 레이블만 변경
        label.text = "사진이름 :" + image[row] //레이블의 글씨를 변경
        }else if component == 1{ // 두번째 컴포넌트는 이미지뷰를 변경
        imgView.image = UIImage(named: image[row]) //이미지를 출력
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: UIImage(named: image[row])) //피커뷰의 각 열을 이미지로 보이게 지정
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150) //피커뷰에 보일 이미지크기를 조정
        
        return imageView
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { //피커뷰 각 열의 높이를 지정
        return 80
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
