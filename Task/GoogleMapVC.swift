//
//  GoogleMapVC.swift
//  Task
//
//  Created by Silverwing Macmini1 on 27/01/20.
//  Copyright © 2020 Silverwing Macmini1. All rights reserved.
//

import UIKit
import GoogleMaps
struct MarkerData
{
    var name : String!
    var latitude : Double!
    var longitude : Double!
}

class GoogleMapVC: UIViewController {
    var markerList = [MarkerData]()
    
    //@IBOutlet weak var mapView: GMSMapView!
   
    var mapView = GMSMapView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
      markerList.append(MarkerData(name: "Bodakdev", latitude: 23.035980, longitude: 72.513126))
      markerList.append(MarkerData(name: "Isckon", latitude: 23.028697, longitude: 72.506290))
      markerList.append(MarkerData(name: "Thaltej", latitude: 23.050542, longitude: 72.498588))
      markerList.append(MarkerData(name: "Sarkhej", latitude: 22.980320, longitude: 72.498588))
        setMarker()
       
    }
    func setMarker(){
       
        let camera = GMSCameraPosition.camera(withLatitude: 23.035980 , longitude: 72.513126    , zoom: 10.0)
        
        mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), camera: camera)
         self.view.addSubview(mapView)
        
        
        for data in markerList{
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: data.latitude,longitude: data.longitude)
            marker.icon = #imageLiteral(resourceName: "pin")
            marker.title = "Ahemdabad"
            marker.snippet = data.name!
            marker.map = mapView
        }
        
       
          
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
