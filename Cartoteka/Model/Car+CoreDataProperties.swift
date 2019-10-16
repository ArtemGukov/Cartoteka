//
//  Car+CoreDataProperties.swift
//  Cartoteka
//
//  Created by Артем on 13/10/2019.
//  Copyright © 2019 Gukov.tech. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged private var bodyColorValue: String
    
    var bodyColor: BodyColor {
        get {
            return BodyColor(rawValue: self.bodyColorValue)!
        }

        set {
            self.bodyColorValue = newValue.rawValue
        }
    }
    
    @NSManaged private var bodyTypeValue: String
    
    var bodyType: BodyType {
        get {
            return BodyType(rawValue: self.bodyTypeValue)!
        }

        set {
            self.bodyTypeValue = newValue.rawValue
        }
    }
    
    @NSManaged private var brandValue: String
    
    var brand: Brand {
        get {
            return Brand(rawValue: self.brandValue)!
        }

        set {
            self.brandValue = newValue.rawValue
        }
    }
    
    @NSManaged public var carId: String

    @NSManaged public var enginePower: Int32
    
    @NSManaged private var engineTypeValue: String
    
    var engineType: EngineType {
        get {
            return EngineType(rawValue: self.engineTypeValue)!
        }

        set {
            self.engineTypeValue = newValue.rawValue
        }
    }
    
    @NSManaged public var engineValue: Double
    @NSManaged public var model: String
    @NSManaged private var transmissionTypeValue: String
    
    var transmissionType: TransmissionType {
        get {
            return TransmissionType(rawValue: self.transmissionTypeValue)!
        }

        set {
            self.transmissionTypeValue = newValue.rawValue
        }
    }
    
    @NSManaged private var wheelDriveValue: String
    
    var wheelDrive: WheelDrive {
        get {
            return WheelDrive(rawValue: self.wheelDriveValue)!
        }

        set {
            self.wheelDriveValue = newValue.rawValue
        }
    }
    
    @NSManaged public var yearOfManufacture: Int32
}
