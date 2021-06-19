//
//  MovementAnalyzeDataModel.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 14/06/21.
//

import Foundation

struct AnalyzeMovementData {
    var recordDate: Date
    var contentIconName: String
    var movementName: String
    var movementAccuracy: String
    var movementLog: [String]
    var videoPath: String
    
    init() {
        recordDate = Date()
        contentIconName = "String"
        movementName = "String"
        movementAccuracy = "String"
        movementLog = ["String"]
        videoPath = "String"
    }
    
    init(recordDates: Date, contentIconNames: String, movementNames: String, movementAccuracys: String, movementLogs: [String], videoPaths: String) {
        recordDate = recordDates
        contentIconName = contentIconNames
        movementName = movementNames
        movementAccuracy = movementAccuracys
        movementLog = movementLogs
        videoPath = videoPaths
    }
}
