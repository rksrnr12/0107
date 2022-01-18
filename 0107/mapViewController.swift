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
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentLocation.text = ""
        currentLocationName.text = ""
        mapViewLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func segamentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.currentLocation.text = ""
            self.currentLocationName.text = ""
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1{
            setAnnotation(latitudeValue: 37.527280, longitudeValue: 126.814876, delta: 0.01, title: "우리집", subtitle: "경기 부천시 역곡로 471번가길 17")
            self.currentLocation.text = "현재위치는"
            self.currentLocationName.text = "우리집"
        }else if sender.selectedSegmentIndex == 2{
            setAnnotation(latitudeValue: 37.587023, longitudeValue: 127.018926, delta: 0.01, title: "안동반점", subtitle: "성북구 안암동")
            self.currentLocation.text = "현재위치는"
            self.currentLocationName.text = "안동반점"
        }
        
    }
    
    func mapViewLoad(){
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    func goLocation(latitudeValue: CLLocationDegrees,longitudeValue: CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        
        mapView.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!) { placemarks, error in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil{
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil{
                address += " "
                address += pm!.thoroughfare!
            }
            self.currentLocation.text = "현재 위치"
            self.currentLocationName.text = address
        }
        locationManager.stopUpdatingLocation()
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span:Double, title Title:String, subtitle SubTitle:String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = Title
        annotation.subtitle = SubTitle
        mapView.addAnnotation(annotation)
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
