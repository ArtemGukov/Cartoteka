//
//  DetailViewController.swift
//  Cartoteka
//
//  Created by Артем on 04/10/2019.
//  Copyright © 2019 Gukov.tech. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
//    MARK: - IBOutlets
    
    @IBOutlet weak var viewBrand: UIView!
    @IBOutlet weak var imageBrandLogo: UIImageView!
    @IBOutlet weak var labelBrand: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    
    @IBOutlet weak var viewEngine: UIView!
    @IBOutlet weak var imageLogoEngine: UIImageView!
    @IBOutlet weak var labelEngineType: UILabel!
    @IBOutlet weak var labelEngineValue: UILabel!
    @IBOutlet weak var labelEnginePower: UILabel!
    
    @IBOutlet weak var viewBody: UIView!
    @IBOutlet weak var labelBodyType: UILabel!
    @IBOutlet weak var labelBodyColor: UILabel!
    @IBOutlet weak var imageLogoBody: UIImageView!
    
    @IBOutlet weak var viewTransmission: UIView!
    @IBOutlet weak var labelTransmissionType: UILabel!
    @IBOutlet weak var labelTransmissionWheelDrive: UILabel!
    @IBOutlet weak var imageLogoTransmission: UIImageView!
    
    var car: Car!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
//    MARK: - Custom methods
    
    func setupUI() {
        
        viewBrand.layer.cornerRadius = 10
        viewEngine.layer.cornerRadius = 10
        viewBody.layer.cornerRadius = 10
        viewTransmission.layer.cornerRadius = 10
        
        guard let imageLogo = UIImage(named: "\(car.brand!.rawValue).png") else { return }
        
        imageBrandLogo.image = imageLogo
        labelBrand.text = "\(car.brand!.rawValue) \(car.model!)"
        labelYear.text = car.yearOfManufacture?.description
        
        labelEngineType.text = car.engineType!.rawValue
        labelEngineValue.text = "\(car.engineValue!) л."
        labelEnginePower.text = "\(car.enginePower!) л. с."
        
        labelBodyType.text = car.bodyType!.rawValue
        labelBodyColor.text = car.bodyColor!.rawValue
        
        labelTransmissionType.text = car.transmissionType!.rawValue
        labelTransmissionWheelDrive.text = "\(car.wheelDrive!.rawValue) привод"
    }
    
//    MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "editSegue" else { return }
        guard let addTableViewController = segue.destination as? AddTableViewController else { return }
        addTableViewController.currentCar = car
    }
    
//    @IBAction func editPressed(segue: UIStoryboardSegue) {
//
//        guard let addTableViewController = segue.source as? AddTableViewController, let car = addTableViewController.newCar  else { return }
//
//        //cars.append(car)
//    }
    
    
}
