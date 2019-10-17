//
//  TableViewController.swift
//  Cartoteka
//
//  Created by Артем on 02/10/2019.
//  Copyright © 2019 Gukov.tech. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var cars = [Car]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchRequest()
    }
    
    //  MARK: - Custom methods
    
    func fetchRequest() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = Car.fetchRequest() as NSFetchRequest<Car>
        let sortDescriptor = NSSortDescriptor(key: "carId", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            cars = try managedContext.fetch(fetchRequest)
            } catch let error {
            print(#line, #function, error)
        }
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

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let deleteAction = UITableViewRowAction(style: .default, title: "Удалить", handler: { (action, indexPath) in
            
            let itemToDelete = self.cars.remove(at: indexPath.row)
            managedContext.delete(itemToDelete)
            appDelegate.saveContext()
        })
    
        deleteAction.backgroundColor = UIColor.red
        return [deleteAction]
    }

//    MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detailSegue" else { return }
        guard let detailViewController = segue.destination as? DetailViewController else { return }
        
        if let carIndex = tableView.indexPathForSelectedRow?.row {
            detailViewController.car = cars[carIndex]
        }
    }
    
    // MARK: - IBActions
   
    @IBAction func savePressed(segue: UIStoryboardSegue) {
        
        guard let addTableViewController = segue.source as? AddTableViewController else { return }
        cars.append(addTableViewController.newCar)
    }
    
    @IBAction func cancelPressed(segue: UIStoryboardSegue) {
        
    }
}

