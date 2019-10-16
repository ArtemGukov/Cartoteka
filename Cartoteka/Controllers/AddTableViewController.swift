//
//  AddTableViewController.swift
//  Cartoteka
//
//  Created by Артем on 04/10/2019.
//  Copyright © 2019 Gukov.tech. All rights reserved.
//

import UIKit
import CoreData

class AddTableViewController: UITableViewController, UITextFieldDelegate {

//    MARK: - IBOutlets
    
    @IBOutlet weak var brandTextField: UITextField!
    
    @IBOutlet weak var imageLogo: UIImageView!
    
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var engineTypeTextField: UITextField!
    @IBOutlet weak var engineValueTextField: UITextField!
    @IBOutlet weak var enginePowerTextField: UITextField!
    
    @IBOutlet weak var bodyTypeTextField: UITextField!
    @IBOutlet weak var bodyColorTextField: UITextField!
    
    @IBOutlet weak var transmissionTypeTextField: UITextField!
    @IBOutlet weak var wheelDriveTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    //    MARK: - Properties
    
    var newCar = Car()
    var currentCar: Car?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var brandPickerData: [String] = Brand.allCases.map { $0.rawValue }.sorted(by: { $0 < $1 })
    var bodyTypePickerData: [String] = BodyType.allCases.map { $0.rawValue }
    var bodyColorPickerData: [String] = BodyColor.allCases.map { $0.rawValue }.sorted(by: { $0 < $1 })
    var wheelDrivePickerData: [String] = WheelDrive.allCases.map { $0.rawValue }
    var transmissionTypePickerData: [String] = TransmissionType.allCases.map { $0.rawValue }.sorted(by: { $0 < $1 })
    var engineTypePickerData: [String] = EngineType.allCases.map { $0.rawValue }.sorted(by: { $0 < $1 })
    
    var yearsPickerData: [String] {
        var years = [String]()
        for i in (1920...2019).reversed() {
            years.append("\(i)")
        }
        return years
    }
    
    var engineValueData: [[String]] = [
        ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
        ["."],
        ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    ]
    
    var enginePowerData: [[String]] = [
        ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
        ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
        ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    ]

    let brandPicker = UIPickerView()
    let yearPicker = UIPickerView()
    
    let engineTypePicker = UIPickerView()
    let engineValuePicker = UIPickerView()
    let enginePowerPicker = UIPickerView()
    
    let bodyTypePicker = UIPickerView()
    let bodyColorPicker = UIPickerView()
    
    let wheelDrivePicker = UIPickerView()
    let transmissionTypePicker = UIPickerView()
    
    let toolbar = UIToolbar()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        createPicker()
        setupEditScreen()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        hideKeyboard()
    }
    
//    MARK: - Custom methods
    
    func createPicker() {
        
        setupToolbar()
                
        brandPicker.tag = 1
        brandPicker.delegate = self
        brandPicker.dataSource = self
        brandTextField.text = ""
        brandTextField.inputView = brandPicker
        brandTextField.delegate = self
        brandTextField.inputAccessoryView = toolbar
        
        yearPicker.tag = 2
        yearPicker.delegate = self
        yearPicker.dataSource = self
        yearTextField.text = ""
        yearTextField.inputView = yearPicker
        yearTextField.delegate = self
        yearTextField.inputAccessoryView = toolbar
        
        engineTypePicker.tag = 3
        engineTypePicker.delegate = self
        engineTypePicker.dataSource = self
        engineTypeTextField.text = ""
        engineTypeTextField.inputView = engineTypePicker
        engineTypeTextField.delegate = self
        engineTypeTextField.inputAccessoryView = toolbar
        
        engineValuePicker.tag = 4
        engineValuePicker.delegate = self
        engineValuePicker.delegate?.pickerView?(engineValuePicker, didSelectRow: 0, inComponent: 0)
        engineValuePicker.delegate?.pickerView?(engineValuePicker, didSelectRow: 0, inComponent: 2)
        engineValuePicker.dataSource = self
        engineValueTextField.text = ""
        engineValueTextField.inputView = engineValuePicker
        engineValueTextField.delegate = self
        engineValueTextField.inputAccessoryView = toolbar
        
        enginePowerPicker.tag = 5
        enginePowerPicker.delegate = self
        enginePowerPicker.delegate?.pickerView?(enginePowerPicker, didSelectRow: 0, inComponent: 0)
        enginePowerPicker.delegate?.pickerView?(enginePowerPicker, didSelectRow: 0, inComponent: 2)
        enginePowerPicker.dataSource = self
        enginePowerTextField.text = ""
        enginePowerTextField.inputView = enginePowerPicker
        enginePowerTextField.delegate = self
        enginePowerTextField.inputAccessoryView = toolbar
        
        bodyTypePicker.tag = 6
        bodyTypePicker.delegate = self
        bodyTypePicker.dataSource = self
        bodyTypeTextField.text = ""
        bodyTypeTextField.inputView = bodyTypePicker
        bodyTypeTextField.delegate = self
        bodyTypeTextField.inputAccessoryView = toolbar
        
        bodyColorPicker.tag = 7
        bodyColorPicker.delegate = self
        bodyColorPicker.dataSource = self
        bodyColorTextField.text = ""
        bodyColorTextField.inputView = bodyColorPicker
        bodyColorTextField.delegate = self
        bodyColorTextField.inputAccessoryView = toolbar
        
        transmissionTypePicker.tag = 8
        transmissionTypePicker.delegate = self
        transmissionTypePicker.dataSource = self
        transmissionTypeTextField.text = ""
        transmissionTypeTextField.inputView = transmissionTypePicker
        transmissionTypeTextField.delegate = self
        transmissionTypeTextField.inputAccessoryView = toolbar
        
        wheelDrivePicker.tag = 9
        wheelDrivePicker.delegate = self
        wheelDrivePicker.dataSource = self
        wheelDriveTextField.text = ""
        wheelDriveTextField.inputView = wheelDrivePicker
        wheelDriveTextField.delegate = self
        wheelDriveTextField.inputAccessoryView = toolbar
    }
    
    func setupToolbar() {
        
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(AddTableViewController.closePickerView))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
    }
    
    @objc func closePickerView() {
        view.endEditing(true)
    }
    
//    MARK: - Methods data source
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.isUserInteractionEnabled = false
        return true
    }
     
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.isUserInteractionEnabled = true
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

    }
    
//    MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let managedContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Car", in: managedContext) else { return }
        
        if currentCar?.carId == nil {
            
            print(#line, #function, "add current car")

            
        switch segue.identifier {
        
            case "saveSegue":
            
            let newCar = NSManagedObject(entity: entity, insertInto: managedContext) as! Car
            
            newCar.carId = UUID().uuidString
            print(newCar.carId)
            
            newCar.brand = Brand(rawValue: brandTextField.text!)!
            newCar.model = modelTextField.text!
            newCar.yearOfManufacture = Int32(yearTextField.text!)!
            
            newCar.engineType = EngineType(rawValue: engineTypeTextField.text!)!
            newCar.engineValue = Double(engineValueTextField.text!)!
            newCar.enginePower = Int32(enginePowerTextField.text!)!
            
            newCar.bodyType = BodyType(rawValue: bodyTypeTextField.text!)!
            newCar.bodyColor = BodyColor(rawValue: bodyColorTextField.text!)!
            
            newCar.wheelDrive = WheelDrive(rawValue: wheelDriveTextField.text!)!
            newCar.transmissionType = TransmissionType(rawValue: transmissionTypeTextField.text!)!
            
            do {
                try managedContext.save()
            } catch let error {
                print(#line, #function, error)
            }
            
            case "cancelSegue":
                break
            
            default:
                break
        }
        } else {
            
            print(#line, #function, "edit current car")
            
            currentCar?.brand = Brand(rawValue: brandTextField.text!)!
            currentCar?.model = modelTextField.text!
            currentCar?.yearOfManufacture = Int32(yearTextField.text!)!
            
            currentCar?.engineType = EngineType(rawValue: engineTypeTextField.text!)!
            currentCar?.engineValue = Double(engineValueTextField.text!)!
            currentCar?.enginePower = Int32(enginePowerTextField.text!)!
            
            currentCar?.bodyType = BodyType(rawValue: bodyTypeTextField.text!)!
            currentCar?.bodyColor = BodyColor(rawValue: bodyColorTextField.text!)!
            
            currentCar?.wheelDrive = WheelDrive(rawValue: wheelDriveTextField.text!)!
            currentCar?.transmissionType = TransmissionType(rawValue: transmissionTypeTextField.text!)!
            
            do {
                try managedContext.save()
            } catch let error {
                print(#line, #function, error)
            }
        }
    }
    
    func areFieldsReady() -> Bool {
        
        return !brandTextField.isEmpty && !modelTextField.isEmpty && !yearTextField.isEmpty && !engineTypeTextField.isEmpty && !engineValueTextField.isEmpty && !enginePowerTextField.isEmpty && !bodyTypeTextField.isEmpty && !bodyColorTextField.isEmpty && !transmissionTypeTextField.isEmpty && !wheelDriveTextField.isEmpty
      }
    
    func setupEditScreen() {
        
        if currentCar?.carId != nil {
            
            title = "Edit"
            
            brandTextField.text = selectedRowPickerView(brandPicker, withText: currentCar!.brand.rawValue)
            modelTextField.text = currentCar!.model
            yearTextField.text = selectedRowPickerView(yearPicker, withText: currentCar!.yearOfManufacture.description)
            
            engineTypeTextField.text = selectedRowPickerView(engineTypePicker, withText: currentCar!.engineType.rawValue)
            enginePowerTextField.text = selectedRowPickerView(enginePowerPicker, withText: currentCar!.enginePower.description)
            engineValueTextField.text = selectedRowPickerView(engineValuePicker, withText: currentCar!.engineValue.description)
            
            bodyTypeTextField.text = selectedRowPickerView(bodyTypePicker, withText: currentCar!.bodyType.rawValue)
            bodyColorTextField.text = selectedRowPickerView(bodyColorPicker, withText: currentCar!.bodyColor.rawValue)
            
            transmissionTypeTextField.text = selectedRowPickerView(transmissionTypePicker, withText: currentCar!.transmissionType.rawValue)
            wheelDriveTextField.text = selectedRowPickerView(wheelDrivePicker, withText: currentCar!.wheelDrive.rawValue)
            
            if let image = UIImage(named: "\(currentCar!.brand.rawValue).png") {
                imageLogo.image = image
            }
            
            
        }
    }
    
    //  MARK:   IBActions
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
    
        print(#line, #function)

        if areFieldsReady() {
            
            self.performSegue(withIdentifier: "saveSegue", sender: nil)

        } else {
            AlertController.alert(message: "Please check all fields", target: self)
        }
    }
}

