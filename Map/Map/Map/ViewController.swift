//
//  ViewController.swift
//  Map
//
//  Created by 강조은 on 2021/08/06.
//

import UIKit
import MapKit

class ViewController: UIViewController , CLLocationManagerDelegate{

    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 정확도 최고로 설정
        locationManager.requestWhenInUseAuthorization()
        // 사용자 어디 있는지 허가 요청 !
        locationManager.startUpdatingHeading()
        // 위치 업데이트 시작
        myMap.showsUserLocation = true
        // 맵뷰 보기 값을 true로 설정
    }
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
        // 위도값 , 경도값 (CLLocationDegree는 도 단위로 지정된 위도, 경도 값임.), delta span : 범위..
        
        //지도를 나타내기 위해 아래  4개 함수 호출해야함!
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        // 위도 및 경도 값을 좌표 데이터 구조 형식으로 형식화함. 위도와 경도값을 반환함
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        // 지도의 확대/축소 수준을 나타냄. 값이 작아질수록 더 확대됨
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        // 특정 위도와 경도를 중심으로 하는 직사각형의 지리적 영역.
        myMap.setRegion(pRegion,animated: true)
        // 현재 보이는 영역을 설정
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees,
                       longitudeValue : CLLocationDegrees, delta span : Double, title
                        strTitle : String, subtitle strSubtitle:String) {
                let annotation = MKPointAnnotation()
                // 지도의 특정 지점에 적용
                annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        // 위치가 업데이트되면 마지막 위치값을 찾아낸다.
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        // 델타 0.01 100배 확대
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            // placemarks의 첫 부분,,만 대입
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil{
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        locationManager.stopUpdatingLocation()
    }
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitudeValue: 37.751853, longitudeValue: 128.87605740000004, delta: 1, title: "한국폴리텍대학 강릉캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한국폴리텍대학 강릉캠퍼스"
        } else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitudeValue: 37.556876, longitudeValue: 126.914066, delta: 0.1, title: "이지스퍼블리싱", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lblLocationInfo1.text = "보고계신 위치"
            self.lblLocationInfo2.text = "이지스퍼블리싱 출판사"
        }
        else if sender.selectedSegmentIndex == 3 {
            setAnnotation(latitudeValue: 37.37818, longitudeValue: 126.95746, delta: 1, title: "우리집", subtitle: "경기도 안양시 동안구 경수대로 610번길 37")
            self.lblLocationInfo1.text = "보고계신 위치"
            self.lblLocationInfo2.text = "우리집"
        }
    }
    
}

