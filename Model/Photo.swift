//
//  Photo.swift
//  TodayQuotes
//
//  Created by Hyowon Choi on 2018. 7. 15..
//  Copyright © 2018년 Hyowonee. All rights reserved.
//

import RealmSwift
import Realm

class Photo: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var imagePath: String = ""
    @objc dynamic var picture = Data()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class DataManager {
    
    var imageFile: String {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path.appending("/images")
    }
    
    func writeData(data: String) {
        do {
            try data.write(toFile: imageFile, atomically: true, encoding: String.Encoding.utf32)
        } catch let error as NSError {
            print("Write Error: \(error.localizedDescription)")
        }
    }
    
    func readData() -> String {
        var storeData = ""
        do {
            storeData = try String(contentsOfFile: imageFile)
        }  catch let error as NSError {
            print("Read Error: \(error.localizedDescription)")
        }
        return storeData
    }
}


