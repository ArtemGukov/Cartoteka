//
//  Extension+AddTableViewController.swift
//  Cartoteka
//
//  Created by Артем on 16/10/2019.
//  Copyright © 2019 Gukov.tech. All rights reserved.
//

import UIKit

extension AddTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            
            switch pickerView.tag {
            case 4:
               return 3
            case 5:
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
                return yearsPickerData.count
            case 3:
                return engineTypePickerData.count
            case 4:
                return engineValueData[component].count
            case 5:
                return enginePowerData[component].count
            case 6:
                return bodyTypePickerData.count
            case 7:
                return bodyColorPickerData.count
            case 8:
                return transmissionTypePickerData.count
            case 9:
                return wheelDrivePickerData.count
            
            default:
                return 0
            }
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            
            switch pickerView.tag {
            case 1:
                return brandPickerData[row]
            case 2:
                return yearsPickerData[row]
            case 3:
                return engineTypePickerData[row]
            case 4:
                return engineValueData[component][row]
            case 5:
                return enginePowerData[component][row]
            case 6:
                return bodyTypePickerData[row]
            case 7:
                return bodyColorPickerData[row]
            case 8:
                return transmissionTypePickerData[row]
            case 9:
                return wheelDrivePickerData[row]

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
                return yearTextField.text = yearsPickerData[row]
            case 3:
                return engineTypeTextField.text = engineTypePickerData[row]
            case 4:
                let digitsValue = engineValueData[0][engineValuePicker.selectedRow(inComponent: 0)]
                let decimalValue = engineValueData[2][engineValuePicker.selectedRow(inComponent: 2)]
                return engineValueTextField.text = "\(digitsValue).\(decimalValue)"
            case 5:
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
            case 6:
                return bodyTypeTextField.text = bodyTypePickerData[row]
            case 7:
                return bodyColorTextField.text = bodyColorPickerData[row]
            case 8:
                return transmissionTypeTextField.text = transmissionTypePickerData[row]
            case 9:
                return wheelDriveTextField.text = wheelDrivePickerData[row]
            
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
            if let row = yearsPickerData.firstIndex(of: text) {
                pickerView.selectRow(row, inComponent: 0, animated: true)
                resultString = yearsPickerData[row]
            }
        case 3:
            if let row = engineTypePickerData.firstIndex(of: text) {
                pickerView.selectRow(row, inComponent: 0, animated: true)
                resultString = engineTypePickerData[row]
            }
        case 4:
            let value = text.components(separatedBy: ".")
        
            pickerView.selectRow(engineValueData[0].firstIndex(of: value[0])!, inComponent: 0, animated: true)
            pickerView.selectRow(engineValueData[2].firstIndex(of: value[1])!, inComponent: 2, animated: true)
            
            let digitsValue = engineValueData[0][engineValuePicker.selectedRow(inComponent: 0)]
            let decimalValue = engineValueData[2][engineValuePicker.selectedRow(inComponent: 2)]
            
            resultString = "\(digitsValue).\(decimalValue)"
        case 5:
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
        case 6:
                if let row = bodyTypePickerData.firstIndex(of: text) {
                    pickerView.selectRow(row, inComponent: 0, animated: true)
                    resultString = bodyTypePickerData[row]
                }
        case 7:
                if let row = bodyColorPickerData.firstIndex(of: text) {
                    pickerView.selectRow(row, inComponent: 0, animated: true)
                    resultString = bodyColorPickerData[row]
                }
        case 8:
                if let row = transmissionTypePickerData.firstIndex(of: text) {
                    pickerView.selectRow(row, inComponent: 0, animated: true)
                    resultString = transmissionTypePickerData[row]
                }
        case 9:
            if let row = wheelDrivePickerData.firstIndex(of: text) {
                pickerView.selectRow(row, inComponent: 0, animated: true)
                resultString = wheelDrivePickerData[row]
            }
        default:
            break
        }
        
        return resultString
    }
}
