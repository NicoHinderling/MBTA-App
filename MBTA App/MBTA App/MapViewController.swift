//
//  ViewController.swift
//  MBTA App
//
//  Created by Nicolas Hinderling on 5/17/17.
//  Copyright © 2017 Nicolas Hinderling. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    var currentCoordinates = CLLocationCoordinate2D()
    var mapView: GMSMapView!
    var zoomLevel: Float = 15.0
    
    override func viewDidLoad() {
        self.title = "Map"
        navigationItem.title = "MBTA Trans"
        
        let currentCoordinate = getCurrentCoordinate()
        
        let camera = GMSCameraPosition.camera(withLatitude: currentCoordinate.latitude,
                                              longitude: currentCoordinate.longitude,
                                              zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.isMyLocationEnabled = true
        
        // Add the map to the view, hide it until we've got a location update.
        view.addSubview(mapView)
    }
}
