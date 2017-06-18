//
//  NearbyViewController.swift
//  MBTA App
//
//  Created by Nicolas Hinderling on 6/17/17.
//  Copyright © 2017 Nicolas Hinderling. All rights reserved.
//

import UIKit

class NearbyViewController: UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = .blue
        self.title = "Nearby"

        stopsByLocation()
    }
}
