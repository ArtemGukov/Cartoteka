//
//  AddTableViewController.swift
//  Cartoteka
//
//  Created by Артем on 04/10/2019.
//  Copyright © 2019 Gukov.tech. All rights reserved.
//

import UIKit

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
    
    //    MARK: - Properties
    
    var newCar = Car()
    var currentCar: Car?
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
        
        bodyTypePicker.tag = 2
        bodyTypePicker.delegate = self
        bodyTypePicker.dataSource = self
        bodyTypeTextField.text = ""
        bodyTypeTextField.inputView = bodyTypePicker
        bodyTypeTextField.delegate = self
        bodyTypeTextField.inputAccessoryView = toolbar
        
        bodyColorPicker.tag = 3
        bodyColorPicker.delegate = self
        bodyColorPicker.dataSource = self
        bodyColorTextField.text = ""
        bodyColorTextField.inputView = bodyColorPicker
        bodyColorTextField.delegate = self
        bodyColorTextField.inputAccessoryView = toolbar

        wheelDrivePicker.tag = 4
        wheelDrivePicker.delegate = self
        wheelDrivePicker.dataSource = self
        wheelDriveTextField.text = ""
        wheelDriveTextField.inputView = wheelDrivePicker
        wheelDriveTextField.delegate = self
        wheelDriveTextField.inputAccessoryView = toolbar
        
        transmissionTypePicker.tag = 5
        transmissionTypePicker.delegate = self
        transmissionTypePicker.dataSource = self
        transmissionTypeTextField.text = ""
        transmissionTypeTextField.inputView = transmissionTypePicker
        transmissionTypeTextField.delegate = self
        transmissionTypeTextField.inputAccessoryView = toolbar
        
        engineTypePicker.tag = 6
        engineTypePicker.delegate = self
        engineTypePicker.dataSource = self
        engineTypeTextField.text = ""
        engineTypeTextField.inputView = engineTypePicker
        engineTypeTextField.delegate = self
        engineTypeTextField.inputAccessoryView = toolbar
        
        yearPicker.tag = 7
        yearPicker.delegate = self
        yearPicker.dataSource = self
        yearTextField.text = ""
        yearTextField.inputView = yearPicker
        yearTextField.delegate = self
        yearTextField.inputAccessoryView = toolbar
        
        engineValuePicker.tag = 8
        engineValuePicker.delegate = self
        engineValuePicker.delegate?.pickerView?(engineValuePicker, didSelectRow: 0, inComponent: 0)
        engineValuePicker.delegate?.pickerView?(engineValuePicker, didSelectRow: 0, inComponent: 2)
        engineValuePicker.dataSource = self
        engineValueTextField.text = ""
        engineValueTextField.inputView = engineValuePicker
        engineValueTextField.delegate = self
        engineValueTextField.inputAccessoryView = toolbar
        
        enginePowerPicker.tag = 9
        enginePowerPicker.delegate = self
        enginePowerPicker.delegate?.pickerView?(enginePowerPicker, didSelectRow: 0, inComponent: 0)
        enginePowerPicker.delegate?.pickerView?(enginePowerPicker, didSelectRow: 0, inComponent: 2)
        enginePowerPicker.dataSource = self
        enginePowerTextField.text = ""
        enginePowerTextField.inputView = enginePowerPicker
        enginePowerTextField.delegate = self
        enginePowerTextField.inputAccessoryView = toolbar

    }
    
    func setupToolbar() {
        
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddTableViewController.closePickerView))
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
    
            newCar = Car(
                brand: Brand(rawValue: brandTextField.text!),
                model: modelTextField.text,
                yearOfManufacture: Int(yearTextField.text!),
            
                engineType: EngineType(rawValue: engineTypeTextField.text!),
                enginePower: Int(enginePowerTextField.text!),
                engineValue: Double(engineValueTextField.text!),
            
                bodyType: BodyType(rawValue: bodyTypeTextField.text!),
                bodyColor: BodyColor(rawValue: bodyColorTextField.text!),
            
                wheelDrive: WheelDrive(rawValue: wheelDriveTextField.text!),
                transmissionType: TransmissionType(rawValue: transmissionTypeTextField.text!)
            )
        }

    func areFieldsReady() -> Bool {
        
        return !brandTextField.isEmpty && !modelTextField.isEmpty && !yearTextField.isEmpty && !engineTypeTextField.isEmpty && !engineValueTextField.isEmpty && !enginePowerTextField.isEmpty && !bodyTypeTextField.isEmpty && !bodyColorTextField.isEmpty && !transmissionTypeTextField.isEmpty && !wheelDriveTextField.isEmpty
      }
    
    func setupEditScreen() {
        
        if currentCar != nil {
            
            title = "Edit"
            
            brandTextField.text = selectedRowPickerView(brandPicker, withText: currentCar!.brand.map { $0.rawValue }!)
            modelTextField.text = currentCar!.model
            yearTextField.text = selectedRowPickerView(yearPicker, withText: (currentCar?.yearOfManufacture!.description)!)
            
            engineTypeTextField.text = selectedRowPickerView(engineTypePicker, withText: currentCar!.engineType.map { $0.rawValue }!)
            enginePowerTextField.text = selectedRowPickerView(enginePowerPicker, withText: currentCar!.enginePower.map { $0.description }!)
            engineValueTextField.text = selectedRowPickerView(engineValuePicker, withText: currentCar!.engineValue.map { $0.description }!)
            
            bodyTypeTextField.text = selectedRowPickerView(bodyTypePicker, withText: currentCar!.bodyType.map { $0.rawValue }!)
            bodyColorTextField.text = selectedRowPickerView(bodyColorPicker, withText: currentCar!.bodyColor.map { $0.rawValue }!)
            
            transmissionTypeTextField.text = selectedRowPickerView(transmissionTypePicker, withText: currentCar!.transmissionType.map { $0.rawValue }!)
            wheelDriveTextField.text = selectedRowPickerView(wheelDrivePicker, withText: currentCar!.wheelDrive.map { $0.rawValue }!)
            
            if let image = UIImage(named: "\(currentCar!.brand!.rawValue).png") {
                imageLogo.image = image
            }
        }
    }

    
    //  MARK:   IBActions
    
    @IBAction func savePressed(_ sender: Any) {
        
        if areFieldsReady() {
            self.performSegue(withIdentifier: "saveSegue", sender: nil)
        } else {
            
            AlertController.alert(message: "Please check all fields", target: self)
            
        }
    }
}
    
//  MARK: - Extensions

extension AddTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            
            switch pickerView.tag {
            case 8:
               return 3
            case 9:
               return 3
            default:
                return 1
            }
        }
    
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            
            switch pickerView.tag {
            case 1:
                return brandPickerData.count
            case 2:
                return bodyTypePickerData.count
            case 3:
                return bodyColorPickerData.count
            case 4:
                return wheelDrivePickerData.count
            case 5:
                return transmissionTypePickerData.count
            case 6:
                return engineTypePickerData.count
            case 7:
                return yearsPickerData.count
            case 8:
                return engineValueData[component].count
            case 9:
                return enginePowerData[component].count

            default:
                return 0
            }
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            
            switch pickerView.tag {
            case 1:
                return brandPickerData[row]
            case 2:
                return bodyTypePickerData[row]
            case 3:
                return bodyColorPickerData[row]
            case 4:
                return wheelDrivePickerData[row]
            case 5:
                return transmissionTypePickerData[row]
            case 6:
                return engineTypePickerData[row]
            case 7:
                return yearsPickerData[row]
            case 8:
                return engineValueData[component][row]
            case 9:
                return enginePowerData[component][row]

            default:
                return nil
            }
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            switch pickerView.tag {
            case 1:
                imageLogo.image = UIImage(named: "\(brandPickerData[row]).png")
                return brandTextField.text = brandPickerData[row]
            case 2:
                return bodyTypeTextField.text = bodyTypePickerData[row]
            case 3:
                return bodyColorTextField.text = bodyColorPickerData[row]
            case 4:
                return wheelDriveTextField.text = wheelDrivePickerData[row]
            case 5:
                return transmissionTypeTextField.text = transmissionTypePickerData[row]
            case 6:
                return engineTypeTextField.text = engineTypePickerData[row]
            case 7:
                return yearTextField.text = yearsPickerData[row]
            case 8:
                let digitsValue = engineValueData[0][engineValuePicker.selectedRow(inComponent: 0)]
                
                let decimalValue = engineValueData[2][engineValuePicker.selectedRow(inComponent: 2)]

                return engineValueTextField.text = "\(digitsValue).\(decimalValue)"
            case 9:
                var resultString = ""
                
                let firstValue = enginePowerData[0][enginePowerPicker.selectedRow(inComponent: 0)]
                
                let secondValue = enginePowerData[1][enginePowerPicker.selectedRow(inComponent: 1)]
                
                let thirdValue = enginePowerData[2][enginePowerPicker.selectedRow(inComponent: 2)]
                
                if firstValue == "0" {
                    resultString = secondValue + thirdValue
                } else {
                    resultString = firstValue + secondValue + thirdValue
                }
                
                return enginePowerTextField.text = resultString
            default:
                break
            }
        }
        
    func selectedRowPickerView(_ pickerView: UIPickerView, withText text: String) -> String {
        
        var resultString = ""
        
        switch pickerView.tag {
            
        case 1:
            if let row = brandPickerData.firstIndex(of: text) {
                pickerView.selectRow(row, inComponent: 0, animated: true)
                resultString = brandPickerData[row]
            }
        case 2:
            if let row = bodyTypePickerData.firstIndex(of: text) {
                pickerView.selectRow(row, inComponent: 0, animated: true)
                resultString = bodyTypePickerData[row]
            }
        case 3:
            if let row = bodyColorPickerData.firstIndex(of: text) {
                pickerView.selectRow(row, inComponent: 0, animated: true)
                resultString = bodyColorPickerData[row]
            }
        case 4:
            if let row = wheelDrivePickerData.firstIndex(of: text) {
                pickerView.selectRow(row, inComponent: 0, animated: true)
                resultString = wheelDrivePickerData[row]
            }
        case 5:
            if let row = transmissionTypePickerData.firstIndex(of: text) {
                pickerView.selectRow(row, inComponent: 0, animated: true)
                resultString = transmissionTypePickerData[row]
            }
        case 6:
            if let row = engineTypePickerData.firstIndex(of: text) {
                pickerView.selectRow(row, inComponent: 0, animated: true)
                resultString = engineTypePickerData[row]
            }
        case 7:
            if let row = yearsPickerData.firstIndex(of: text) {
                pickerView.selectRow(row, inComponent: 0, animated: true)
                resultString = yearsPickerData[row]
            }
        case 8:

            let value = text.components(separatedBy: ".")
        
            pickerView.selectRow(engineValueData[0].firstIndex(of: value[0])!, inComponent: 0, animated: true)
            pickerView.selectRow(engineValueData[2].firstIndex(of: value[1])!, inComponent: 2, animated: true)
            
            let digitsValue = engineValueData[0][engineValuePicker.selectedRow(inComponent: 0)]
            
            let decimalValue = engineValueData[2][engineValuePicker.selectedRow(inComponent: 2)]
            
            resultString = "\(digitsValue).\(decimalValue)"

        case 9:
                
            let value = text.compactMap { String($0) }
            
            pickerView.selectRow(enginePowerData[0].firstIndex(of: value[0])!, inComponent: 0, animated: true)
            pickerView.selectRow(enginePowerData[1].firstIndex(of: value[1])!, inComponent: 1, animated: true)
            pickerView.selectRow(enginePowerData[2].firstIndex(of: value[2])!, inComponent: 2, animated: true)
                
            let firstValue = enginePowerData[0][enginePowerPicker.selectedRow(inComponent: 0)]
                
            let secondValue = enginePowerData[1][enginePowerPicker.selectedRow(inComponent: 1)]
                
            let thirdValue = enginePowerData[2][enginePowerPicker.selectedRow(inComponent: 2)]
                
                if firstValue == "0" {
                    resultString = secondValue + thirdValue
                } else {
                    resultString = firstValue + secondValue + thirdValue
                }
            
        default:
            break
        }
        
        return resultString

}

}
