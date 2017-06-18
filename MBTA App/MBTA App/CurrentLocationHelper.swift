//
//  CurrentLocationHelper.swift
//  MBTA App
//
//  Created by Nicolas Hinderling on 6/17/17.
//  Copyright © 2017 Nicolas Hinderling. All rights reserved.
//

import GoogleMaps

func getCurrentCoordinate() -> CLLocationCoordinate2D {
    let locationManager = CLLocationManager()
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestAlwaysAuthorization()
    locationManager.distanceFilter = 50
    locationManager.startUpdatingLocation()
    
    if (locationManager.location != nil) {
        // If shared, use their actual location
        return locationManager.location!.coordinate
    }
    
    // If the user doesn't share their location, just use this default lat long value for now
    return CLLocationCoordinate2D(latitude: 42.3506253, longitude: -71.0895669)
}
