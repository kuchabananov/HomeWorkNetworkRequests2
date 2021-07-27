//
//  GeoUserVC.swift
//  NetworkRequests
//
//  Created by Евгений on 27.07.21.
//

import UIKit
import MapKit

class GeoUserVC: UIViewController {
    
    @IBOutlet weak var userMap: MKMapView!
    
    var address: Address?
    var geo: Geo?


    override func viewDidLoad() {
        super.viewDidLoad()
        updateMap(lat: (geo?.lat)!, lng: (geo?.lng)!, title: (address?.street)!)
    }
    
    
    func updateMap(lat: String, lng: String, title: String) {
        let lat = Double(lat)!
        let lng = Double(lng)!
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        annotation.title = "\(title)"
        
        //let userLocation = CLLocation(latitude: lat, longitude: lng)
        let regionRadius: CLLocationDistance = 100000.0
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        userMap.addAnnotation(annotation)
        userMap.setRegion(region, animated: true)
        
    }
    
}


