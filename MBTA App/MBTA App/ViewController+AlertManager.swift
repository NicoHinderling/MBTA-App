//
//  ViewController+AlertManager.swift
//  MBTA App
//
//  Created by Nicolas Hinderling on 6/17/17.
//  Copyright © 2017 Nicolas Hinderling. All rights reserved.
//

import UIKit

extension UIViewController {
    func showOKAlertView(title: String?, message: String?) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertView, animated: true, completion: nil)
    }
}
