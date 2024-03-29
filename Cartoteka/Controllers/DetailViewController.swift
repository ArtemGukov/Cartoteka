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
        
        if let imageLogo = UIImage(named: "\(car.brand.rawValue).png") {
            imageBrandLogo.image = imageLogo
        }
                
        labelBrand.text = "\(car.brand.rawValue) \(car.model)"
        labelYear.text = car.yearOfManufacture.description
        
        labelEngineType.text = car.engineType.rawValue
        labelEngineValue.text = "\(car.engineValue) л."
        labelEnginePower.text = "\(car.enginePower) л. с."
        
        labelBodyType.text = car.bodyType.rawValue
        labelBodyColor.text = car.bodyColor.rawValue
        
        labelTransmissionType.text = car.transmissionType.rawValue
        labelTransmissionWheelDrive.text = "\(car.wheelDrive.rawValue) привод"
        
        setupBackgroundColor()
    }
    
    func setupBackgroundColor() {
        
        switch car.bodyColor {
        
        case .yellow:
            view.backgroundColor = .yellow
        case .red:
            view.backgroundColor = .red
        case .blue:
            view.backgroundColor = .blue
        case .green:
            view.backgroundColor = .green
        case .black:
            view.backgroundColor = .black
        case .grey:
            view.backgroundColor = .lightGray
        case .orange:
            view.backgroundColor = .orange
        default:
            view.backgroundColor = .white

            viewBrand.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            viewBrand.layer.borderWidth = 0.7
            viewEngine.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            viewEngine.layer.borderWidth = 0.7
            viewBody.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            viewBody.layer.borderWidth = 0.7
            viewTransmission.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            viewTransmission.layer.borderWidth = 0.7
        }
    }
    
//    MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "editSegue" else { return }
        guard let addTableViewController = segue.destination as? AddTableViewController else { return }
        addTableViewController.currentCar = car
    }
}
