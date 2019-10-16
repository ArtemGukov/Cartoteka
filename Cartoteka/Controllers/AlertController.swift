//
//  AlertController.swift
//  Cartoteka
//
//  Created by Артем on 07/10/2019.
//  Copyright © 2019 Gukov.tech. All rights reserved.
//

import UIKit

class AlertController: UIAlertController {
    class func alert(message: String, target: UIViewController) {
        let alert = UIAlertController(title: "Oups, error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) {
            (result: UIAlertAction) -> Void in
        })
        
        target.present(alert, animated: true, completion: nil)
    }
}
