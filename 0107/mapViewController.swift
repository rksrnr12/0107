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
        
    }
    
    func mapViewLoad(){
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    func goLocation(latitudeValue: CLLocationDegrees,longitudeValue: CLLocationDegrees, delta span :Double) {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        
        mapView.setRegion(pRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let pLocation = locations.last
        goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
