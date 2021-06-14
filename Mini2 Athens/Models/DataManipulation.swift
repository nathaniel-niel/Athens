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
//    var model = [MovementAnalyzeData]()
//
//    //MARK: CoreData
//    func createNewData(dataIndex: Int, contentIconName: String, movementName: String, movmentAccuracy: String, analyzeDate: String){
//        // akses app Delegate
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//
//        // akses container coreData
//        let manageContext = appDelegate.persistentContainer.viewContext
//
//        //akses entity dari core data untuk bisa assign value ke attribute di core data.
//        guard let AnalyzeEntity = NSEntityDescription.entity(forEntityName: "AnalyzeData", in: manageContext) else {return}
//
//        let data = NSManagedObject(entity: AnalyzeEntity , insertInto: manageContext)
//        data.setValue(dataIndex, forKey: "dataIndex")
//        data.setValue(contentIconName, forKey: "movementImageName")
//        data.setValue(movementName, forKey: "movementName")
//        data.setValue(analyzeDate, forKey: "analyzeDate")
//        data.setValue(movmentAccuracy, forKey: "accuracy")
//
//        //save data
//        do {
//            try manageContext.save()
//        } catch  let error as NSError{
//            print(error.localizedDescription)
//        }
//    }
//
//    func retrieveData(){ //fetch data from core data
//        // make data model empty berfore retrieve
//        model.removeAll()
//        // akses app Delegate
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//
//        // akses container coreData
//        let manageContext = appDelegate.persistentContainer.viewContext
//
//        // prepare fetch from core data entity
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Story")
//        
//        //sort data by
//        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "fileIndex", ascending: true)]
//
//        // harus menggunakan do catch
//        do {
//            let result = try manageContext.fetch(fetchRequest)
//            for data in result as! [NSManagedObject]{
//                model.append(MovementAnalyzeData(contentIconName: data.value(forKey: "movementImageName") as! String, movementName: data.value(forKey: "movementName") as! String, analyzeDate: data.value(forKey: "analyzeDate") as! String, accuracy: "accuracy"))
//            }
//        } catch  let error as NSError{
//            print ("Error: \(error.localizedDescription)")
//        }
//    }
    
    
    
}
