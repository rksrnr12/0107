//
//  mapViewController.swift
//  0107
//
//  Created by 한국 on 2022/01/17.
//

import UIKit
import MapKit

class mapViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var currentLocation: UILabel!
    @IBOutlet var currentLocationName: UILabel!
    
    let locationManager = CLLocationManager() //위치정보를 설정하기위한 CLLocationManager클래스를 상수로 설정
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentLocation.text = ""      //초기화면은 아무것도 뜨지않게 설정
        currentLocationName.text = ""
        mapViewLoad() //mapView에 위치를 표시하기위한 함수를 실행한다

        // Do any additional setup after loading the view.
    }
    
    @IBAction func segamentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 { //세스먼트 컨트롤의 각 번호로 이동했을때 실행되는 코드들 이다
            self.currentLocation.text = ""    //레이블에 아무것도 적지않는다
            self.currentLocationName.text = ""
            locationManager.startUpdatingLocation() //locationManager에 현재위치를 업데이트해준다
        } else if sender.selectedSegmentIndex == 1{
            setAnnotation(latitudeValue: 37.527280, longitudeValue: 126.814876, delta: 0.01, title: "우리집", subtitle: "경기 부천시 역곡로 471번가길 17")
            self.currentLocation.text = "현재위치는"   //내가 원하는 지역의 위도와 경도를 직접 설정해 지도위에 핀을 꽂아준다
            self.currentLocationName.text = "우리집"
        }else if sender.selectedSegmentIndex == 2{
            setAnnotation(latitudeValue: 37.587023, longitudeValue: 127.018926, delta: 0.01, title: "안동반점", subtitle: "성북구 안암동")
            self.currentLocation.text = "현재위치는"
            self.currentLocationName.text = "안동반점"
        }
        
    }
    
    func mapViewLoad(){
        
        locationManager.delegate = self //상수locationManager의 델리게이트를 self로 설정해준다
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //정확도를 최고로 설정해준다
        locationManager.requestWhenInUseAuthorization() //사용자의 위치사용 승인을 요구하는 함수
        locationManager.startUpdatingLocation() //위치정보를 업데이트합니다
        mapView.showsUserLocation = true //mapView에 유저위치보기를 true로 설정합니다
    }
    
    func goLocation(latitudeValue: CLLocationDegrees,longitudeValue: CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
                     //원하는 위치를 지도에 나타내기 위한 함수로 latitubeValue = 위도를 longitude = 경도를 delta span = 지도의 크기를 지정해 주는것이다
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
                        //입력받은 위도와 경도값을 CLLocationCoordinate2DMake함수에 넣어주고 리턴값을 상수로 지정해준다
                        //위 함수는 위도와 경도값을 입력받아 죄표데이터구조형식으로 바꿔주는 함수이다
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) // 입력받은 범위값을 이 함수에 넣어주고 리턴값을 상수로 지정해준다
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue) //위에서 지정한 위도,경도를 사용한 위치와 범위를 넣어주고 리턴값을 상수로 지정한다
        
        mapView.setRegion(pRegion, animated: true) //mapView에 위에서 만든 위치를 나타낸다
        return pLocation
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
                        //위치를 설정해주기 위한 함수 업데이트된 위치는 locations에 넣어준다
        let pLocation = locations.last //마지막에 업데이트된 위치를 상수에 넣어준다
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
                        //마지막에 업데이트된 위치의 위도와 경도값을 goLocation함수에 넣어주고 지도는 100배 확대된 상태로 나타낸다
        CLGeocoder().reverseGeocodeLocation(pLocation!) { placemarks, error in //위에서 찾은 위도와 경도값으로 위치의 주소를 찾아내고 placemarks에 넣어준다
            let pm = placemarks!.first //placemarks의 첫부분만 상수 pm에 넣어준다
            let country = pm!.country //pm의 나라정보를 상수 country 넣어준다
            var address:String = country! //문자열 변수 address안에 country를 넣어준다
            if pm!.locality != nil{ //위에서 찾은 주소에 지역주소가 존재하면 다음 코드를 실행한다
                address += " " //문자열 띄어쓰기를 위한 빈문자를 넣어준다
                address += pm!.locality! //pm안에 있는 지역주소를 address문자열에 넣어준다
            }
            if pm!.thoroughfare != nil{ //위에서 찾은 주소에 도로값이 존재하면 다음 코드를 실행한다
                address += " "
                address += pm!.thoroughfare! //pm안에 있는 도로값을 address에 넣어준다
            }
            self.currentLocation.text = "현재 위치"
            self.currentLocationName.text = address //지정한 레이블에 위에서 찾은 주소값을 나타낸다
        }
        locationManager.stopUpdatingLocation() //지도의 위치 업데이트를 중지한다
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span:Double, title Title:String, subtitle SubTitle:String){  //원하는 위치에 핀을 설치하기 위한 함수로 위도,경도,범위값과 핀의 타이틀과 서브타이틀을 입력 피라미터로 지정한다
        let annotation = MKPointAnnotation() //핀을 설치하기 위한 MKPointAnnotation함수를 annotation상수에 넣어준다
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
                               //핀을 설치할 죄표를 goLocation함수를 이용해 넣어준다
        annotation.title = Title //입력받은 타이틀을 핀 타이틀에 넣어준다
        annotation.subtitle = SubTitle //입력받은 서브타이틀을 핀 서브타이틀에 넣어준다
        mapView.addAnnotation(annotation) //mapView에 핀을 추가해준다
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
