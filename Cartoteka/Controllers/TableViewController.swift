//
//  TableViewController.swift
//  Cartoteka
//
//  Created by Артем on 02/10/2019.
//  Copyright © 2019 Gukov.tech. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var cars = [Car]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSample()
    }
    
    //  MARK: - Custom methods
    
    func loadSample() {
        cars = Car.loadSample()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count 
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CarViewCell
        let car = cars[indexPath.row]
        
        configure(cell: cell, with: car)
        return cell
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            print("Delete tapped")
            
            self.cars.remove(at: indexPath.row)
        })
    
        deleteAction.backgroundColor = UIColor.red
        
        return [deleteAction]
    }

    // MARK: - Navigation
    
    @IBAction func cancelPressed(segue: UIStoryboardSegue) {
        
    }
   
    @IBAction func savePressed(segue: UIStoryboardSegue) {
        
        guard let addTableViewController = segue.source as? AddTableViewController, let car = addTableViewController.newCar  else { return }
        
        cars.append(car)
    }
}

extension TableViewController {
    func configure(cell: CarViewCell, with car: Car) {
        
        cell.labelModel.text = "\(car.brand!.rawValue) \(car.model!), \(car.yearOfManufacture!)"
        cell.labelEngineType.text = "\(car.engineValue!) / \(car.enginePower!) л. с. / \(car.engineType!.rawValue)"
        cell.labelTransmissionType.text = car.transmissionType?.rawValue
        cell.labelBodyType.text = car.bodyType!.rawValue
        cell.labelBodyColor.text = car.bodyColor!.rawValue
        
        guard let imageLogo = UIImage(named: "\(car.brand!.rawValue).png") else { return }
        cell.imageLogo.image = imageLogo

    }
}
