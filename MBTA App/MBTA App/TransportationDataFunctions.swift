//
//  TransportationDataFunctions.swift
//  MBTA App
//
//  Created by Nicolas Hinderling on 6/17/17.
//  Copyright © 2017 Nicolas Hinderling. All rights reserved.
//

import Alamofire
import SwiftyJSON

// Gonna ditch this API for GTFS-Realtime going forward
func stopsByLocation() {
    let mbtaApiKey = getMBTAAPIKey()
    let currentCoordinates = getCurrentCoordinate()
    let request = NSURLComponents(string: "http://realtime.mbta.com/developer/api/v2/stopsbylocation")!
    
    request.queryItems = [
        URLQueryItem(name: "api_key", value: mbtaApiKey),
        URLQueryItem(name: "lat", value: String(currentCoordinates.latitude)),
        URLQueryItem(name: "lon", value: String(currentCoordinates.longitude)),
        URLQueryItem(name: "format", value: "json")
    ]
    guard let requestURL = request.string else { fatalError("Error: stopsByLocation url generation failed.") }
    
    Alamofire.request(requestURL).responseJSON { response in
        if let data = response.data {
            let json = JSON(data: data)
            
            if json["stop"].count == 0 {
                print("User not within 1 mile of an MBTA stop")
                return
            }

            // List of 15 closest stop names
            for stop in 1...json["stop"].count {
                if let stopName = json["stop"][stop]["stop_name"].string {
                    print(stopName)
                }
            }
        }
    }
}

private func getMBTAAPIKey() -> String {
    guard let path = Bundle.main.path(forResource: "Keys", ofType: "plist") else {
        fatalError("You're missing Keys.plist which contains the Google Maps License Key")
    }
    
    guard let mbtaApiKey = NSDictionary(contentsOfFile: path)?["MBTAApiKey"] as? String else {
        fatalError("\"mapsApiKey\" seems to be missing from your Keys.plist")
    }
    
    return mbtaApiKey
}
