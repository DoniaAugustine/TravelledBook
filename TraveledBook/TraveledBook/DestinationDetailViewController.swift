//
//  DestinationDetailViewController.swift
//  TraveledBook
//
//  Created by Deep shah on 2022-09-14.
//

import UIKit
import MapKit

class DestinationDetailViewController: UIViewController {
    var city: Cities?
    var Latitudes : Double?
    var Longitudes : Double?
    var savedData : TravelData?
   

    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var DestName : UILabel!
    @IBOutlet weak var mapViews: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Latitudes = (savedData?.destLatitude)!
        Longitudes = (savedData?.destLongitude)!
        
        let initialLocation = CLLocation(latitude: Latitudes!, longitude: Longitudes!)
        
        mapViews.centerToLocation(initialLocation)
        
        let artwork = Artwork(
            title: String((savedData?.destinationName)!),
          locationName: String((savedData?.destinationName)!),
         // discipline: "Sculpture",
          coordinate: CLLocationCoordinate2D(latitude: Latitudes!, longitude: Longitudes!))
        mapViews.addAnnotation(artwork)
        

        DestName.text = savedData?.destinationName
        if let img = UIImage(data: (savedData?.images)!)! as? UIImage {
            cityImageView.image = img
        }
      
    }
    
    @IBAction func ViewMap(_ sender: UIButton) {
        
        if let map = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as?  MapViewController{
            
            //  map.destLat = (savedData?.destLatitude)!
            //  map.destLong = (savedData?.destLongitude)!
            map.destLong = 23.56
            map.destLong = 23.34
            map.saveDataArr = savedData
            
            self.present(map, animated: true, completion: nil)
            
           // self.navigationController?.pushViewController(map, animated: true)
        }
    }

    
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
