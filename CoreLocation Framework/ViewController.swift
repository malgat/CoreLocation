//
//  ViewController.swift
//  CoreLocation Framework
//
//  Created by D7703_16 on 2019. 11. 11..
//  Copyright © 2019년 201720632. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController{
    @IBOutlet weak var myMapView: MKMapView!
    
    //위치
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //위치 트래킹 시작
        locationManager.startUpdatingLocation()
        
        //보안 풀기 => 작동을 위해서. plist에
        //Privacy - Location Always and When In Use Usage Description
        //Privacy - Location When In Use Usage Description 추가.
        locationManager.requestAlwaysAuthorization()
        
        //현재 위치 표시
        myMapView.showsUserLocation = true
        
        let center = CLLocationCoordinate2DMake(35.166197, 129.072594)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        myMapView.setRegion(region, animated: true)
        
        //pin
        let dit = MKPointAnnotation()
        dit.coordinate = center
        dit.title = "DIT 동의과학대학교"
        dit.subtitle = "나의 꿈이 자라는 곳"
        let bp = MKPointAnnotation()
        bp.coordinate.latitude = 35.168444
        bp.coordinate.longitude = 129.057832
        bp.title = "부산시민공원"
        bp.subtitle = "부산시민들의 휴식처"
        let sq = MKPointAnnotation()
        sq.coordinate.latitude = 35.1641918
        sq.coordinate.longitude = 129.0627412
        sq.title = "송상현 광장"
        sq.subtitle = "부산시민들의 휴식처"
        myMapView.addAnnotation(dit)
        myMapView.addAnnotation(bp)
        myMapView.addAnnotation(sq)
    }
}

