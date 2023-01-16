//
//  MapViewController.swift
//  TraveledBook
//
//  Created by Deep shah on 2022-09-14.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet private var mapview: MKMapView!
    
    
    var destLat: Double?
    var destLong: Double?
    var saveDataArr : TravelData?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // print(destLat)
      //  print(destLong)
       
        let initialLocation = CLLocation(latitude:(saveDataArr?.destLatitude)! , longitude: (saveDataArr?.destLongitude)!)
        
        mapview.centerToLocation(initialLocation)
    }

}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 10000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
