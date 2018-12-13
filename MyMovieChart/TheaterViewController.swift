//
//  TheaterViewController.swift
//  MyMovieChart
//
//  Created by user on 2018. 12. 12..
//  Copyright © 2018년 galaxia communications. All rights reserved.
//

import UIKit
import MapKit

class TheaterViewController : UIViewController {
    var param : NSDictionary!
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        // branch test
        self.navigationItem.title = self.param["상영관명"] as? String
        
        let lat = (param["위도"] as! NSString).doubleValue
        let lng = (self.param["경도"] as! NSString).doubleValue
        
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        let regionRadius : CLLocationDistance = 100
        
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        self.map.setRegion(coordinateRegion, animated: true)
        
        let point = MKPointAnnotation()
        point.coordinate = location
        self.map.addAnnotation(point)
    }
    
}
