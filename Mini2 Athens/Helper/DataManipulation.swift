//
//  DataManipulation.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 14/06/21.
//

import Foundation
import CoreData
import UIKit

class DataManipulation{
    var model = [AnalyzeMovementData]()
    
    //MARK: CoreData
    func createNewData(recordDate: Date, contentIconName: String, movementName: String, movementAccuracy: String, movementLog: [String], videoPath: String){
        // akses app Delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        // akses container coreData
        let manageContext = appDelegate.persistentContainer.viewContext

        //akses entity dari core data untuk bisa assign value ke attribute di core data.
//        guard let AnalyzeEntity = NSEntityDescription.entity(forEntityName: "AnalyzeData", in: manageContext) else {return}
        let currentEntity = AnalyzeData(context: manageContext)

        currentEntity.analyzeDate = recordDate
        currentEntity.movementImageName = contentIconName
        currentEntity.movementName = movementName
        currentEntity.accuracy = movementAccuracy
        currentEntity.movementLog = movementLog
        currentEntity.videoPath = videoPath
        
//        let data = NSManagedObject(entity: AnalyzeEntity , insertInto: manageContext)
//        data.setValue(recordDate, forKey: "analyzeDate")
//        data.setValue(contentIconName, forKey: "movementImageName")
//        data.setValue(movementName, forKey: "movementName")
//        data.setValue(movementAccuracy, forKey: "accuracy")
//        data.setValue(movementLog, forKey: "movementLog")
//        data.setValue(videoPath, forKey: "videoPath")

        //save data
        do {
            try manageContext.save()
        } catch  let error as NSError{
            print(error.localizedDescription)
        }
    }

    func retrieveData(){ //fetch data from core data
        // make data model empty berfore retrieve
        model.removeAll()
        // akses app Delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        // akses container coreData
        let manageContext = appDelegate.persistentContainer.viewContext

        // prepare fetch from core data entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AnalyzeData")
        
        //sort data by
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "analyzeDate", ascending: false)]

        // harus menggunakan do catch
        do {
            let result = try manageContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                model.append(AnalyzeMovementData(recordDates: data.value(forKey: "analyzeDate") as! Date, contentIconNames: data.value(forKey: "movementImageName") as! String, movementNames: data.value(forKey: "movementName") as! String, movementAccuracys: data.value(forKey: "accuracy") as! String, movementLogs: data.value(forKey: "movementLog") as! [String], videoPaths: data.value(forKey: "videoPath") as! String))
            }
        } catch  let error as NSError{
            print ("Error: \(error.localizedDescription)")
        }
    }
    
    
    
}
