//
//  Data.swift
//  Cartoteka
//
//  Created by Артем on 02/10/2019.
//  Copyright © 2019 Gukov.tech. All rights reserved.
//

import Foundation
import UIKit

struct Car {
        
    var brand: Brand?
    var model: String?
    var yearOfManufacture: Int?
    
    var engineType: EngineType?
    var enginePower: Int?
    var engineValue: Double?
    
    var bodyType: BodyType?
    var bodyColor: BodyColor?
    
    var wheelDrive: WheelDrive?
    var transmissionType: TransmissionType?
}

extension Car {
    
    static func loadSample() -> [Car] {
       return [
        Car(brand: .kia,
            model: "Ceed",
            yearOfManufacture: 2019,
            engineType: .petrol,
            enginePower: 130,
            engineValue: 1.6,
            bodyType: .hatchback,
            bodyColor: .red,
            wheelDrive: .front,
            transmissionType: .automatic
        ),
        Car(brand: .audi,
            model: "A1",
            yearOfManufacture: 2011,
            engineType: .petrol,
            enginePower: 150,
            engineValue: 1.4,
            bodyType: .coupe,
            bodyColor: .white,
            wheelDrive: .four,
            transmissionType: .automatic
        ),
        Car(brand: .mercedes,
            model: "E200",
            yearOfManufacture: 1991,
            engineType: .diesel,
            enginePower: 190,
            engineValue: 2.0,
            bodyType: .sedan,
            bodyColor: .blue,
            wheelDrive: .four,
            transmissionType: .automatic
        ),
        Car(brand: .lada,
            model: "Vesta",
            yearOfManufacture: 2019,
            engineType: .petrol,
            enginePower: 102,
            engineValue: 1.8,
            bodyType: .universal,
            bodyColor: .yellow,
            wheelDrive: .front,
            transmissionType: .mechanic
        ),
        Car(brand: .toyota,
            model: "Prius",
            yearOfManufacture: 2012,
            engineType: .electric,
            enginePower: 102,
            engineValue: 1.2,
            bodyType: .hatchback,
            bodyColor: .white,
            wheelDrive: .front,
            transmissionType: .variator
        )
        ]
    }
}
