//
//  Extension+TableViewController.swift
//  Cartoteka
//
//  Created by Артем on 16/10/2019.
//  Copyright © 2019 Gukov.tech. All rights reserved.
//

import UIKit

extension TableViewController {
    func configure(cell: CarViewCell, with car: Car) {

        cell.labelModel.text = "\(car.brand.rawValue) \(car.model), \(car.yearOfManufacture)"
        cell.labelEngineType.text = "\(car.engineValue) / \(car.enginePower) л. с. / \(car.engineType.rawValue)"
        cell.labelTransmissionType.text = car.transmissionType.rawValue
        cell.labelBodyType.text = car.bodyType.rawValue
        cell.labelBodyColor.text = car.bodyColor.rawValue

        if let imageLogo = UIImage(named: "\(car.brand.rawValue).png") {
            cell.imageLogo.image = imageLogo
        }
    }
}
