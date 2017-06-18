//
//  HomeViewController.swift
//  MBTA App
//
//  Created by Nicolas Hinderling on 6/17/17.
//  Copyright © 2017 Nicolas Hinderling. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Maps tab
        let mapsTab = MapViewController()
        mapsTab.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "globe"), selectedImage: #imageLiteral(resourceName: "globe"))
        
        // Favorites tab
        let favoritesTab = FavoritesViewController()
        favoritesTab.tabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "star"), selectedImage: #imageLiteral(resourceName: "star"))
        
        // Nearby tab
        let nearbyTab = NearbyViewController()
        nearbyTab.tabBarItem = UITabBarItem(title: "Nearby", image: #imageLiteral(resourceName: "location"), selectedImage: #imageLiteral(resourceName: "location"))
        
        self.viewControllers = [mapsTab, favoritesTab, nearbyTab]
    }
}
