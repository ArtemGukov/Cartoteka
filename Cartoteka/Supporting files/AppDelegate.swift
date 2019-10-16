//
//  AppDelegate.swift
//  Cartoteka
//
//  Created by Артем on 02/10/2019.
//  Copyright © 2019 Gukov.tech. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        preloadedData()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    private func preloadedData() {
        
        let preloadedDataKey = "didPreloadData"
        let userDafaults = UserDefaults.standard
        
        if userDafaults.bool(forKey: preloadedDataKey) == false {
            
            guard let urlPath = Bundle.main.url(forResource: "PreloadedData", withExtension: "plist") else { return }
            
            let backgroundContext = persistentContainer.newBackgroundContext()
            persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
            
            backgroundContext.perform {
                
                if let arrayContents = NSArray(contentsOf: urlPath) {
                    
                    do {
                        for item in arrayContents {
                            let carObject = Car(context: backgroundContext)
                            
                            let carDictionary = item as! NSDictionary
                            carObject.carId = carDictionary["carId"] as! String
                            
                            carObject.brand = Brand(rawValue: carDictionary["brandValue"] as! String)!
                            carObject.model = carDictionary["model"] as! String
                            carObject.yearOfManufacture = (carDictionary["yearOfManufacture"] as! Int32)
                            
                            carObject.engineType = EngineType(rawValue: carDictionary["engineTypeValue"] as! String)!
                            carObject.engineValue = carDictionary["engineValue"] as! Double
                            carObject.enginePower = carDictionary["enginePower"] as! Int32
                            
                            carObject.bodyType = BodyType(rawValue: carDictionary["bodyTypeValue"] as! String)!
                            carObject.bodyColor = BodyColor(rawValue: carDictionary["bodyColorValue"] as! String)!
                            
                            carObject.transmissionType = TransmissionType(rawValue: carDictionary["transmissionTypeValue"] as! String)!
                            carObject.wheelDrive = WheelDrive(rawValue: carDictionary["wheelDriveValue"] as! String)!
                        }
                        
                        try backgroundContext.save()
                        userDafaults.set(true, forKey: preloadedDataKey)
                        
                    } catch let error {
                        print(#line, #function, error)
                    }
                }
            }
        }
    }

    // MARK: - Core Data stack

        lazy var persistentContainer: NSPersistentContainer = {
            
            let container = NSPersistentContainer(name: "Cartoteka")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()

        // MARK: - Core Data Saving support

        func saveContext () {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
    }


